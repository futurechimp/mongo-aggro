require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class FeedTest < Test::Unit::TestCase
      
  context "Feed Model" do
    should 'construct new instance' do
      @feed = Feed.new
      assert_not_nil @feed
    end    
    
    should "validate presence of image" do
      @feed = Feed.make
      assert @feed.valid?
      @feed.remove_image!
      assert !@feed.valid?   
    end
    
    should "validate presence of url" do
      @feed = Feed.make
      assert @feed.valid?
      @feed.url = ""
      assert !@feed.valid?
      @feed.url = nil
      assert !@feed.valid?
    end
        
    should "validate presence of wire" do
      @feed = Feed.make
      assert @feed.valid?
      @feed.wire = nil
      assert !@feed.valid?
    end    
    
    should "validate format of url" do
      @feed = Feed.make 
      assert @feed.valid?
      @feed.url = "blah"
      assert !@feed.valid?
      @feed.url = "http://foo.com"
      assert @feed.valid?
    end    
    
    context "image upload" do
      setup do
        @feed = Factory.make_stubbed_feed
        
        file = File.new PADRINO_ROOT + "/test/fixtures/omegaman.jpg"        
        @feed.image = file
        @feed.save!
      end
      
      should "work" do
        @feed.reload
        assert_equal "omegaman.jpg", @feed.image_filename
      end
    end
    
    context "after create" do
      setup do
        @feed = Factory.make_stubbed_feed
      end
    
      should "make a POST request to the octopus" do
        assert_requested :post, 
          subscription_url,
          successful_subscription_request_body(@feed)
      end
    end

    context "updating with fresh feed data" do
      context "for a feed with no items" do
        setup do
          @feed = Factory.make_stubbed_feed
          @feed.update_feed_items(good_feed_content)
        end
    
        should "add the incoming feed content to the feed" do
          assert_equal(FeedNormalizer::FeedNormalizer.parse(
            good_feed_content).items.length, @feed.feed_items.length)
        end
      end
      
      context "updating when an item in the feed has no content" do
        should "work"
      end
    end
    
    # context "for a feed which includes images in its item descriptions" do
    #   setup do
    #     FeedItem.destroy_all
    #     @feed = Factory.make_stubbed_feed
    #     WebMock.allow_net_connect!
    #     @feed.update_feed_items(good_feed_content)
    #   end
    # 
    #   should "insert an image for each item in the feed" do
    #     @feed.feed_items.each do |item|
    #       assert_equal("blah", item.image.url)
    #     end
    #   end
    # end   
    
  end
end
