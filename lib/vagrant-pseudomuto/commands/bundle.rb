module Pseudomuto
  module VagrantPlugin
    module Commands
      class Bundle < Vagrant.plugin('2', :command)

        def execute
          PLUGINS.each do |plugin|
            install(plugin[:name], plugin[:version])
          end
        end

        private

        def install(plugin, version)
          unless installed_plugins =~ /^#{plugin} \(#{version}\)/
            system("vagrant plugin install #{plugin} --plugin-version #{version}")
          end
        end

        def installed_plugins
          `vagrant plugin list`
        end
      end
    end
  end
end
