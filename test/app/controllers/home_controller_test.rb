require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class HomeControllerTest < Test::Unit::TestCase
  context "HomeController" do
    setup do
      get '/'
    end

    should "work" do
      assert last_response.ok?
    end
  end
end
