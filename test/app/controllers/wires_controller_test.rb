require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class WiresControllerTest < Test::Unit::TestCase
  context "WiresController" do
    context "index action" do
      setup do
        get '/wires'
      end

      should "work" do
        assert last_response.ok?
      end
    end
    
    context "show action" do
      context "when the @wire has no feed_items" do
        setup do
          @wire = Wire.make
          @wire.save
          get "/wires/show/#{@wire.id}"
        end

        should "work" do
          puts last_request.params
          assert last_response.ok?
        end
      end
      
      context "when the @wire has feed_items" do
        setup do
          @wire = Factory.make_wire
          @feed_items = @wire.feed_items
          get "/wires/show/#{@wire.id}"
        end
        
        should "work" do
          puts last_request.params
          assert last_response.ok?
        end
        
        should "display the wire name as a title"
        
        should "display all wire names in a list"
        
        should "display titles for @wire#feed_items" do
          @feed_items.each do |item| 
            assert_match /#{item.title}/, last_response.body
          end
        end
                
      end
    end
  end
end
