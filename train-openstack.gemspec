lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'train-openstack/version'

Gem::Specification.new do |spec|
	spec.name = 'train-openstack'
	spec.version = TrainPlugins::OpenstackClient::VERSION
	spec.authors = ['Léo Depriester']
	spec.email = ['leo.depriester@camptocamp.com']
	spec.summary = "Openstack plugin for Inspec's Backend (WIP)"
	spec.license = 'Apache-2.0'
	spec.files = %w{
		train-openstack.gemspec Gemfile
	} + Dir.glob(
		'lib/**/*', File::FNM_DOTMATCH
	).reject { |f| File.directory?(f) }
	spec.require_paths = ['lib']

	spec.add_dependency 'openstack', '~> 1.1'
end
