require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class HomeControllerTest < Test::Unit::TestCase
  context "HomeController" do
    
    context "with no FeedItems" do
      setup do
        get '/'
      end
      
      should "work" do
        assert last_response.ok?
      end  
      
      should "have the 'labs' title in the layout" do
        assert_match "Labs", last_response.body
      end
    end
    
    context "with 1 FeedItem" do
      setup do
        FeedItem.make
        get '/'
      end
      
      should "work" do
        assert last_response.ok?
      end
    end    
  end
end
