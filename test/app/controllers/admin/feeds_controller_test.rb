require File.expand_path(File.dirname(__FILE__) + '/../../../test_config.rb')


class Admin::FeedsControllerTest < Test::Unit::TestCase
  context "Admin::FeedsController" do

    context "on GET to index" do
      setup do
        FeedItem.destroy_all
        @feed_item = FeedItem.make
        @feed_item.save
        get '/admin/feeds'
      end

      should "work" do
        assert last_response.ok?
      end

      should "display the url of @feed_item" do
        assert_match @feed_item.url, last_response.body
      end
    end

    context "on GET to new" do
      setup do
        @wire = Wire.make
        @wire.save
        get '/admin/feeds/new'
      end

      should "work" do
        assert last_response.ok?
        assert_match /New/, last_response.body
      end
      
      should "insert the @wire name into the body" do
        assert last_response.body.include?(@wire.name)
      end
    end

    context "on GET to edit" do
      setup do
        @wire = Wire.make
        @wire.save
        @feed = Factory.make_stubbed_feed
        @feed.save
        get "/admin/feeds/edit/#{@feed.id}"
      end

      should "work" do
        assert last_response.ok?
        assert_match /#{@feed.url}/, last_response.body
      end
      
      should "insert the @wire name into the body" do
        assert last_response.body.include?(@wire.name)
      end      
      
    end

    context "on POST to notify" do
      context "with good params" do
        context "on an empty feed" do
          setup do
            @feed = Factory.make_stubbed_feed
            @original_feed_item_count = FeedItem.count
            @feed_length = FeedNormalizer::FeedNormalizer.parse(
                                        good_feed_content).entries.length
            post "/admin/feeds/notify/#{@feed.to_param}", 
                                                  :data => good_feed_content
          end
    
          should "work" do
            assert last_response.ok?
          end
    
          should "respond with success message" do
            assert_equal(last_response.body, "success")
          end
  
          should_eventually "add as many feed_items as are in the feed" do
            assert_equal(
              @original_feed_item_count + @feed_length, FeedItem.count
            )
          end
        end
      end
    end

    #   context "with an existing feed but bad feed body content" do
    # 
    #   end
    # 
    #   context "with a nonexistent feed url" do
    # 
    #   end
    # end

  end
end

