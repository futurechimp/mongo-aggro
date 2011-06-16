require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class UpdatesControllerTest < Test::Unit::TestCase
  context "UpdatesController" do

    context "on POST to notify" do
      context "with good params" do
        context "on an empty feed" do
          setup do
            @feed = Factory.make_stubbed_feed
            @wire = Wire.make
            @wire.save
            @feed.wire = @wire
            @feed.save
            @original_feed_item_count = FeedItem.count
            @feed_length = FeedNormalizer::FeedNormalizer.parse(
                                        good_feed_content).entries.length
            post "/updates/notify/#{@feed.to_param}", 
                                                  :data => good_feed_content
          end

          should "work" do
            assert last_response.ok?
          end

          should "respond with success message" do
            assert_equal("success", last_response.body)
          end

          should_eventually "add as many feed_items as are in the feed" do
            assert_equal(
              @original_feed_item_count + @feed_length, FeedItem.count
            )
          end
        end

        context "when the user decides to change the @feed#wire" do
          setup do
            @feed = Factory.make_stubbed_feed
            @wire = Wire.make
            @wire.save
            @feed.wire = @wire
            @feed.save
            @other_wire = Wire.make 
            @other_wire.save
            post "/updates/notify/#{@feed.to_param}", 
                                          :data => {:wire_id => @other_wire.id }
            @feed.reload
          end 

          should "update the @feed's wire properly" do
            assert_equal(@wire, @feed.wire)
          end         
        end

      end
    end

  end
end
