require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class FeedItemTest < Test::Unit::TestCase
  context "FeedItem Model" do
    should 'construct new instance' do
      @feed_item = FeedItem.new
      assert_not_nil @feed_item
    end
    
    should "validate_presence_of :body" do
      @feed_item = FeedItem.make(:with_feed_and_wire)
      assert @feed_item.valid?
      @feed_item.body = ""
      assert !@feed_item.valid?
      @feed_item.body = nil
      assert !@feed_item.valid?
    end
    
    should "validate_presence_of :url" do
      @feed_item = FeedItem.make(:with_feed_and_wire)
      assert @feed_item.valid?
      @feed_item.url = ""
      assert !@feed_item.valid?
      @feed_item.url = nil
      assert !@feed_item.valid?
    end
    
    should "validate_presence_of :title" do
      @feed_item = FeedItem.make(:with_feed_and_wire)
      assert @feed_item.valid?
      @feed_item.title = ""
      assert !@feed_item.valid?
      @feed_item.title = nil
      assert !@feed_item.valid?
    end
    
    should "validate_presence_of :feed" do
      @feed_item = FeedItem.make(:with_feed_and_wire)
      assert @feed_item.valid?
      @feed_item.feed = nil
      assert !@feed_item.valid?
    end    
    
    should "validate_presence_of :wire" do
      @feed_item = FeedItem.make(:with_feed_and_wire)
      assert @feed_item.valid?
      @feed_item.wire = nil
      assert !@feed_item.valid?
    end
    
    should "validate_presence_of :moderation_status" do
      @feed_item = FeedItem.make(:with_feed_and_wire)
      assert @feed_item.valid?
      @feed_item.moderation_status = nil
      assert !@feed_item.valid?      
    end
    
    should "pass validation when moderation_status is 'published'" do
      @feed_item = FeedItem.make(:with_feed_and_wire)
      @feed_item.moderation_status = "published"
      assert @feed_item.valid?
    end
    
    should "pass validation when moderation_status is 'featured'" do
      @feed_item = FeedItem.make(:with_feed_and_wire)
      @feed_item.moderation_status = "featured"
      assert @feed_item.valid?
    end
    
    should "fail validation when moderation_status is 'foo'" do
      @feed_item = FeedItem.make(:with_feed_and_wire)
      @feed_item.moderation_status = "foo"
      assert !@feed_item.valid?
    end
    
    should_eventually "validate format of url"
    should_eventually "validate presence of date"
    should_eventually "validate uniqueness of url"
    
    context "image upload" do
      setup do
        @feed_item = FeedItem.make(:with_feed_and_wire)
        
        file = File.new PADRINO_ROOT + "/test/fixtures/omegaman.jpg"        
        @feed_item.image = file
        @feed_item.save!
      end
      
      should "work" do
        @feed_item.reload
        assert_equal "omegaman.jpg", @feed_item.image_filename
      end
    end
    
    context "testing images" do
      context "with an image" do
        setup do
          @feed_item = FeedItem.make(:with_feed_and_wire)
          file = File.new PADRINO_ROOT + "/test/fixtures/omegaman.jpg"
          @feed_item.image = file
          @feed_item.save!
        end
        
        context "with moderation_status 'published'" do
          should "return the small image file path" do
            assert_equal(
              "/grid/feed_item/image/#{@feed_item.to_param}/small_omegaman.jpg",
              @feed_item.item_image
            )
          end          
        end
        
        context "with moderation_status 'featured'" do
          setup do
            @feed_item.moderation_status = "featured"
            @feed_item.save
          end
          
          should "return the image file path" do
            assert_equal(
              "/grid/feed_item/image/#{@feed_item.to_param}/omegaman.jpg",
              @feed_item.item_image
            )
          end
        end        
      end
      
      context "with no image" do
        setup do
          @feed_item = FeedItem.make(:with_feed_and_wire)
        end
        
        should "return a default image" do
          assert_equal(
            "/images/fallback/default.png", 
            @feed_item.image.url
          )
        end
      end
    end
    
  end
end
