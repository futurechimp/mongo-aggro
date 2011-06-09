require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class HomeControllerTest < Test::Unit::TestCase
  context "HomeController" do
    
    setup do
      FeedItem.destroy_all
      Wire.destroy_all
    end    
    
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
    
    context "with FeedItems" do
      setup do
        @feed_items = Factory.make_wire.feed_items
        get '/'
      end
      
      should "work" do
        assert last_response.ok?
      end
      
      should "have the 'labs' title in the layout" do
        assert_match "Labs", last_response.body
      end  
      
      should "output the @feed_item title" do
        @feed_items.each do |feed_item|
          assert_match(/#{feed_item.title}/, last_response.body)
        end
      end
    end
    
    context "with Wires" do
      setup do
        @wire = Wire.make
        @wire.save
        get '/'
      end
      
      should "output the @wire#name" do
        assert_match(/#{@wire.name}/, last_response.body)
      end
    end  
    
    context "with no Wires" do
      setup do
        get '/'
      end
      
      should "not output the Topics list" do
        assert_no_match(/<h2>Topics<\/h2>/, last_response.body)
      end
    end    
  end
end
