require 'openstack'
require 'train-openstack/platform'

module TrainPlugins
	module OpenstackClient
		class Connection < Train::Plugins::Transport::BaseConnection
			include TrainPlugins::OpenstackClient::Platform

			def initialize(options)
				os_auth_url = ENV['OS_AUTH_URL'],
				os_domain_name = ENV['OS_DOMAIN_NAME'],
				os_identity_api_version = ENV['OS_IDENTITY_API_VERSION'],
				os_image_api_version = ENV['OS_IMAGE_API_VERSION'],
				os_password = ENV['OS_PASSWORD'],
				os_project_domain_name = ENV['OS_PROJECT_DOMAIN_NAME'],
				os_project_name = ENV['OS_PROJECT_NAME'],
				os_region_name = ENV['OS_REGION_NAME'],
				os_tenant_name = ENV['OS_TENANT_NAME'],
				os_username = ENV['OS_USERNAME'],
				os_user_domain_name = ENV['OS_USER_DOMAIN_NAME'],
				os_version = ENV['OS_VERSION'],
				os_volume_api_version = ENV['OS_VOLUME_API_VERSION']

				@opts = {
					api_key: os_password,
					auth_method: 'password',
					authtenant_name: os_tenant_name,
					auth_url: os_auth_url,
					username: os_username,
					user_domain: os_user_domain_name,
					project_name: os_project_name,
					project_domain_name: os_project_domain_name,
					region: os_region_name
				}
				super(options)

				begin
					@client = Openstack::Connection.create(@opts)
				rescue => e
					raise Train::TransportError, e
				end
			end

			def local?
				false
			end

			def uri
				'openstack://'
			end

			def client
				@client
			end
		end
	end
end
