module TrainPlugins::OpenstackClient
	module Platform
		def platform
			Train::Platforms.name('openstack')
			force_platform!('openstack', release: TrainPlugins::OpenstackClient::VERSION)
		end
	end
end
