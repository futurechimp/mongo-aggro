require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class FeedItemTest < Test::Unit::TestCase
  context "FeedItem Model" do
    should 'construct new instance' do
      @feed_item = FeedItem.new
      assert_not_nil @feed_item
    end
    
    should "validate_presence_of :body" do
      @feed_item = FeedItem.make
      assert @feed_item.valid?
      @feed_item.body = ""
      assert !@feed_item.valid?
      @feed_item.body = nil
      assert !@feed_item.valid?
    end
    
    should "validate_presence_of :url" do
      @feed_item = FeedItem.make
      assert @feed_item.valid?
      @feed_item.url = ""
      assert !@feed_item.valid?
      @feed_item.url = nil
      assert !@feed_item.valid?
    end
    
  end
end
