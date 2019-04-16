require 'openstack'
require 'train-openstack/platform'

module TrainPlugins
	module OpenstackClient
		class Connection < Train::Plugins::Transport::BaseConnection
			include TrainPlugins::OpenstackClient::Platform

			def initialize(options)
				@opts = options
				super(options)
			end

			def local?
				false
			end

			def uri
				'openstack://'
			end

			def openstack_resource(service_type)
				@opts[:service_type] = service_type
				OpenStack::Connection.create(@opts)
			end
		end
	end
end
