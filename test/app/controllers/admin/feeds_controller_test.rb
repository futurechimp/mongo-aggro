require File.expand_path(File.dirname(__FILE__) + '/../../../test_config.rb')


class Admin::FeedsControllerTest < Test::Unit::TestCase
  context "Admin::FeedsController" do

    setup do
      Account.delete_all
      Feed.delete_all
    end
    
    context "when logged in" do
      setup do
        @account = Factory.make_admin
        login_as(@account)
      end
      
      context "on GET to index" do
        setup do
          FeedItem.destroy_all
          @feed_item = FeedItem.make
          @feed_item.save
          get '/admin/feeds'
        end

        should "work" do
          assert last_response.ok?
        end

        should "display the url of @feed_item" do
          assert_match @feed_item.url, last_response.body
        end
      end

      context "on GET to new" do
        setup do
          @wire = Wire.make
          @wire.save
          get '/admin/feeds/new'
        end

        should "work" do
          assert last_response.ok?
          assert_match /New/, last_response.body
        end

        should "insert the @wire name into the body" do
          assert last_response.body.include?(@wire.name)
        end
      end

      context "on GET to edit" do
        setup do
          @wire = Wire.make
          @wire.save
          @feed = Factory.make_stubbed_feed
          @feed.save
          get "/admin/feeds/edit/#{@feed.id}"
        end

        should "work" do
          assert last_response.ok?
          assert_match /#{@feed.url}/, last_response.body
        end

        should "insert the @wire name into the body" do
          assert last_response.body.include?(@wire.name)
        end

      end  
      
      context "on PUT to update" do
        setup do
          @wire = Wire.make
          @wire.save!
          @other_wire = Wire.make
          @other_wire.save!
          @feed = Factory.make_stubbed_feed
          @feed.wire = @wire
          @feed.save
          put "/admin/feeds/update/#{@feed.id}", { 
            :feed => { :wire_id => @other_wire.id }
          }
          @feed.reload
        end
        
        should "update the wire" do
          assert_equal(@other_wire.id, @feed.wire.id)
        end
      end
        
    end



    #   context "with an existing feed but bad feed body content" do
    # 
    #   end
    # 
    #   context "with a nonexistent feed url" do
    # 
    #   end
    # end

  end
end

