libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'train-openstack/version'
require 'train-openstack/transport'
require 'train-openstack/platform'
require 'train-openstack/connection'
