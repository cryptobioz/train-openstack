require 'train-openstack/connection'

module TrainPlugins
	module OpenstackClient
		class Transport < Train.plugin(1)
			name 'openstack'

			option :server, required: true, default: ENV['PUPPETDB_SERVER']
			option :key, default: ENV['PUPPETDB_KEY']
			option :cert, default: ENV['PUPPETDB_CERT']
			option :cacert, default: ENV['PUPPETDB_CACERT']
			option :auth_url, default: ENV['OS_AUTH_URL'],
			option :domain_name, default: ENV['OS_DOMAIN_NAME']
			option :password, default: ENV['OS_PASSWORD']
			option :project_domain_name, default: ENV['OS_PROJECT_DOMAIN_NAME']
			option :project_name, default: ENV['OS_PROJECT_NAME']
			option :region_name, default: ENV['OS_REGION_NAME']
			option :tenant_name, default: ENV['OS_TENANT_NAME']
			option :username, default: ENV['OS_USERNAME']
			option :user_domain_name, default: ENV['OS_USER_DOMAIN_NAME']

			def connection(_instance_opts = nil)
				@connection ||= TrainPlugins::OpenstackClient::Connection.new(@options)
			end
		end
	end
end
