module TestHelper
  module StubbedWebRequests

    def stub_request_for_feed_image(image_url)
      stub_request(:any, image_url).to_return(
        :body => File.new(feed_item_image), :status => 200)
    end

  end
end