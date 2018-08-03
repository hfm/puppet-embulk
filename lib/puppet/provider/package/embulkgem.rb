require 'puppet/provider/package'

Puppet::Type.type(:package).provide(:embulkgem, parent: :gem) do
  desc 'Install plugin via embulk gem (included by embulk). Ruby Gem support.'

  has_feature :versionable, :install_options, :uninstall_options

  commands gemcmd: "#{ENV['HOME']}/.embulk/bin/embulk"

  def self.gemlist(options)
    gem_list_command = [command(:gemcmd), 'gem', 'list']

    gem_list_command << if options[:local]
                          '--local'
                        else
                          '--remote'
                        end
    if options[:source]
      gem_list_command << '--source' << options[:source]
    end
    name = options[:justme]
    if name
      gem_list_command << '^' + name + '$'
    end

    begin
      list = execute(gem_list_command).lines
                                      .map { |set| gemsplit(set) }
                                      .reject { |x| x.nil? }
    rescue Puppet::ExecutionFailure => detail
      raise Puppet::Error, "Could not list gems: #{detail}", detail.backtrace
    end

    return list.shift if options[:justme]
    list
  end

  def install(useversion = true)
    command = [command(:gemcmd), 'gem', 'install']
    command << '-v' << resource[:ensure] if (!resource[:ensure].is_a? Symbol) && useversion

    source = resource[:source]
    if source
      begin
        uri = URI.parse(source)
      rescue => detail
        raise Puppet::Error, "Invalid source '#{uri}': #{detail}", detail
      end

      case uri.scheme
      when nil
        # no URI scheme => interpret the source as a local file
        command << source
      when %r{file}i
        command << uri.path
      when 'puppet'
        # we don't support puppet:// URLs (yet)
        raise Puppet::Error, 'puppet:// URLs are not supported as gem sources'
      else
        # check whether it's an absolute file path to help Windows out
        if Puppet::Util.absolute_path?(source)
          command << source
        else
          # interpret it as a gem repository
          command << '--source' << source.to_s << resource[:name]
        end
      end
    else
      command << '--no-rdoc' << '--no-ri' << resource[:name]
    end

    command += install_options if resource[:install_options]

    output = execute(command)
    # Apparently some stupid gem versions don't exit non-0 on failure
    raise "Could not install: #{output.chomp}" if output.include?('ERROR')
  end

  def uninstall
    command = [command(:gemcmd), 'gem', 'uninstall']
    command << '--executables' << '--all' << resource[:name]

    command += uninstall_options if resource[:uninstall_options]

    output = execute(command)

    # Apparently some stupid gem versions don't exit non-0 on failure
    raise "Could not uninstall: #{output.chomp}" if output.include?('ERROR')
  end
end
