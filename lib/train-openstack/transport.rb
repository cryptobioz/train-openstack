require 'train-openstack/connection'

module TrainPlugins
	module OpenstackClient
		class Transport < Train.plugin(1)
			name 'openstack'

			option :auth_url, default: ENV['OS_AUTH_URL']
			option :auth_method, default: 'password'
			option :username, default: ENV['OS_USERNAME']
			option :api_key, default: ENV['OS_PASSWORD']
			option :user_domain, default: ENV['OS_USER_DOMAIN_NAME']
			option :project_domain_name, default: ENV['OS_PROJECT_DOMAIN_NAME']
			option :project_name, default: ENV['OS_PROJECT_NAME']
			option :region, default: ENV['OS_REGION_NAME']
			option :authtenant_name, default: ENV['OS_TENANT_NAME']
			option :authtenant_id, default: ENV['OS_TENANT_ID']

			def connection(_instance_opts = nil)
				@connection ||= TrainPlugins::OpenstackClient::Connection.new(@options)
			end
		end
	end
end
