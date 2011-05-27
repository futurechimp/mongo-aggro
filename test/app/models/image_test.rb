require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ImageTest < Test::Unit::TestCase
  context "Image Model" do

    setup do
      FeedItem.delete_all
    end
    
    should 'construct new instance' do
      @image = Image.new
      assert_not_nil @image
    end

    context "upload" do
      setup do
        @feed_item = FeedItem.make(:with_feed_and_wire)
        @image = Image.new
        @feed_item.image = @image
        
        file = File.new PADRINO_ROOT + "/test/fixtures/omegaman.jpg"
        @image.file = file
        
        @feed_item.image.save!
      end
      
      should "work" do
        @feed_item.reload
        assert_equal "omegaman.jpg", @feed_item.image.file_filename
      end
      
    end
  end
end
