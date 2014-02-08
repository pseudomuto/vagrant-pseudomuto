module Pseudomuto
  module VagrantPlugin
    module Actions
      class SSHConfig

        def initialize(app, env)
          @app = app
        end

        def call(env)
          unless key_already_added?
            env[:ui].info "[pseudomuto] Adding private key to guest..."
            add_private_key
          else
            env[:ui].error "[pseudomuto] SSH key is present"
          end

          @app.call(env)
        end

        private

        def key_already_added?
          `ssh-add -L` =~ /\Assh-rsa/
        end

        def add_private_key
          system("ssh-add #{key_path}")
        end

        def key_path
          "~/.ssh/id_rsa"
        end

      end
    end
  end
end
