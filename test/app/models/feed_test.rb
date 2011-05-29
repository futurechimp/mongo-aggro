require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class FeedTest < Test::Unit::TestCase
      
  context "Feed Model" do
    should 'construct new instance' do
      @feed = Feed.new
      assert_not_nil @feed
    end    
    
    should "validate presence of url" do
      @feed = Feed.make
      assert @feed.valid?
      @feed.url = ""
      assert !@feed.valid?
      @feed.url = nil
      assert !@feed.valid?
    end
    
    should "validate format of url"    
    
    should "validate presence of wire" do
      @feed = Feed.make
      assert @feed.valid?
      @feed.wire = nil
      assert !@feed.valid?
    end
    
    context "image upload" do
      setup do
        @feed = Feed.make
        
        file = File.new PADRINO_ROOT + "/test/fixtures/omegaman.jpg"        
        @feed.image = file
        @feed.save!
      end
      
      should "work" do
        @feed.reload
        assert_equal "omegaman.jpg", @feed.image_filename
      end
    end
    
    # context "after create" do
    #   setup do
    #     @feed = Factory.make_stubbed_feed
    #   end
    # 
    #   should "make a POST request to the octopus" do
    #     assert_requested :post, subscription_url, successful_subscription_request_body(@feed)
    #   end
    # end
    # 
    # context "updating with fresh feed data" do
    #   context "for a feed with no items" do
    #     setup do
    #       @feed = Factory.make_stubbed_feed
    #       @feed.update_feed_items(good_feed_content)
    #     end
    # 
    #     should "add the incoming feed content to the feed" do
    #       assert_equal(FeedNormalizer::FeedNormalizer.parse(
    #         good_feed_content).items.length, @feed.feed_items.length)
    #     end
    #   end
    # end    
    
  end
end
