PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
require File.expand_path(File.dirname(__FILE__) + "/blueprints.rb")


class Test::Unit::TestCase
  include RR::Adapters::RRMethods
  include Rack::Test::Methods

  def app
    ##
    # You can handle all padrino applications using instead:
    #   Padrino.application
    Mongoaggro.tap { |app|  }
  end
end
