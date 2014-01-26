module Pseudomuto
  module VagrantPlugin
    module Actions
      class Cookbooks
        def initialize(app, env)
          @app = app
        end

        def call(env)
          @env = env
          ui.info "Cloning cookbooks..."

          unless cookbooks_installed?
            clone_cookbooks
          else
            update_cookbooks
          end

          @app.call(env)
        end

        private

        def config_path
          File.join(@env[:root_path], '.vagrant')
        end

        def cookbooks_path
          File.join(config_path, 'cookbooks')
        end

        def cookbooks_installed?
          Dir.exists?(cookbooks_path)
        end

        def clone_cookbooks
          puts "Cloning cookbooks..."
          ui.info "Cloning cookbooks to #{cookbooks_path}"

          cmd = <<-COMMAND
          set -e
          mkdir -p #{config_path} && cd #{config_path}
          git clone https://github.com/pseudomuto/kitchen-sink.git cookbooks
          COMMAND

          system(cmd)
        end

        def update_cookbooks
          ui.info "Updating cookbooks at #{cookbooks_path}"

          cmd = <<-COMMAND
          set -e
          cd #{cookbooks_path}
          git pull origin master
          COMMAND

          system(cmd)
        end

        def ui
          @env[:ui]
        end
      end
    end
  end
end
