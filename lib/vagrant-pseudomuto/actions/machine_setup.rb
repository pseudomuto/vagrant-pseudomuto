module Pseudomuto
  module VagrantPlugin
    module Actions
      class MachineSetup

        def initialize(app, env)
        end

        def call(env)
          env[:ui].info "[pseudomuto] verifying /etc/hosts entries..."

          ensure_host_rules([
            'pseudocms.dev'
          ])
        end

        private

        def ensure_host_rules(hosts)
          host_file = File.read('/etc/hosts')
          hosts.delete_if { |key| host_file =~ /\s#{key}/ }

          unless hosts.empty?
            puts 'Shopify Vagrant wants to add the following host rules to /etc/hosts:'
            hosts.each { |host| puts "#{VAGRANT_IP} #{host}" }
            puts 'Please authenticate.'

            hosts.each do |host|
              system "sudo sh -c \"echo '#{VAGRANT_IP} #{host}' >> /etc/hosts\""
            end
          end
        end
      end
    end
  end
end
