module TestHelper
  module StubbedWebRequests

    def stub_request_for_large_feed_image(image_url)
      stub_request(:any, image_url).to_return(
        :body => File.new(large_feed_item_image), :status => 200)
    end
    
    def stub_request_for_small_feed_image(image_url)
      stub_request(:any, image_url).to_return(
        :body => File.new(small_feed_item_image), :status => 200)
    end    

  end
end