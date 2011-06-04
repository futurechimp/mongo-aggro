require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class ImageFinderTest < Test::Unit::TestCase

  context "The ImageFinder module" do
    setup do
      class Foo  
        include ImageFinder
      end

      @model_object = Foo.new
    end

    context "using sample data containing valid image URLs" do
      setup do
        stub_request_for_large_feed_image(
          "http://www.somefakesite.com/huge.jpg"
        )
        stub_request_for_small_feed_image(
          "http://www.somefakesite.com/small.png"
        )        
        @data = dummy_data
      end

      should "be able to figure out the largest pixel size image in the data" do
        largest_image = "http://www.somefakesite.com/huge.jpg"
        assert_equal(largest_image, @model_object.largest_image(@data))
      end
    end
    
    context "using sample data containing no image URLs" do
      setup do
        @data = "blah blah blah"
      end

      should "return nil" do
        largest_image = "http://www.somefakesite.com/huge.jpg"
        assert_nil(@model_object.largest_image(@data))
      end
    end    
  end
  
  
  def dummy_data
    %Q(blah blah foo http://www.somefakesite.com/huge.jpg blah
      more bullshit I'm talking http://www.somefakesite.com/small.png
      wow this is some great feed data I am kicking out here.)
  end
  
end