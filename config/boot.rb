# Defines our constants
PADRINO_ENV  = ENV["PADRINO_ENV"] ||= ENV["RACK_ENV"] ||= "development"  unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, PADRINO_ENV)

require 'carrierwave/orm/mongoid'

##
# Enable devel logging
#
# Padrino::Logger::Config[:development] = { :log_level => :devel, :stream => 
# :stdout }
# Padrino::Logger.log_static = true
#

##
# Add your before load hooks here
#
Padrino.before_load do
end

##
# Add your after load hooks here
#
Padrino.after_load do
end

Padrino.load!

if File.exist?("#{Padrino.root}/config/server.yml")
  config = YAML.load_file("#{Padrino.root}/config/server.yml")
  SERVER_URL = config["server"]["host"]
  OCTOPUS_HOST = config["octopus"]["host"]
  OCTOPUS_PORT = config["octopus"]["port"]
end

SERVER_URL = "http://localhost:3000" unless defined?(SERVER_URL)
puts "Server url: #{SERVER_URL}"

OCTOPUS_HOST = config["octopus"]["host"] unless defined?(OCTOPUS_HOST)
OCTOPUS_PORT = config["octopus"]["port"] unless defined?(OCTOPUS_PORT)
OCTOPUS_URL = "http://#{OCTOPUS_HOST}:#{OCTOPUS_PORT}"

