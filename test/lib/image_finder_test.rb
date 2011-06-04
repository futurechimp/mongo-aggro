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
    
    context "using sample data containing image URLs which 404" do
      setup do
        @data = "blah blah blah http://somenonexistentimage.com/foo.jpg"
      end

      should "return nil" do
        largest_image = "http://www.somefakesite.com/huge.jpg"
        stub_404(
          "http://somenonexistentimage.com/foo.jpg"
        )        
        assert_nil(@model_object.largest_image(@data))
      end
    end    

    context "using sample data containing image URLs which timeout" do
      setup do
        @data = "blah blah blah http://somenonexistentsite.com/foo.jpg"
      end

      should "return nil" do
        stub_request(:any, "http://somenonexistentsite.com/foo.jpg").to_timeout
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