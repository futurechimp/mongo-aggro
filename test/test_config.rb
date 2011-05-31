PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
require File.expand_path(File.dirname(__FILE__) + "/support/stubbed_octopus_calls")
require File.expand_path(File.dirname(__FILE__) + "/support/stubbed_web_requests")
require File.expand_path(File.dirname(__FILE__) + "/blueprints.rb")

# require 'webmock'

class Test::Unit::TestCase
  include RR::Adapters::RRMethods
  include Rack::Test::Methods
  include WebMock
  
  include TestHelper::StubbedOctopusCalls
  include TestHelper::StubbedWebRequests

  WebMock.disable_net_connect!(:allow_localhost => true)

  def app
    ##
    # You can handle all padrino applications using instead:
    Padrino.application
    # Mongoaggro.tap { |app|  }
  end
end
