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
    
  end
end
