require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class OctopusTest < Test::Unit::TestCase

  context "The Octopus interface" do
    should "have a 'create_resource' method" do
      assert Octopus.respond_to? "create_resource"
    end

    context "hitting the 'create_resource' method" do
      context "when the octopus is running happily" do
        setup do
          @feed = Feed.make
          stub_successful_net_resource_creation(@feed)
          Octopus.create_resource(@feed)
        end

        should "post a '/create' request to the octopus" do
          assert_requested :post, subscription_url, successful_subscription_request_body(@feed)
        end        
      end
      
      context "when the octopus is not available" do
        setup do
          @feed = Feed.make      
          stub_successful_net_resource_creation(@feed).to_timeout
          assert_raise(Timeout::Error) do
            Octopus.create_resource(@feed)
          end
        end
        
        should "raise an error" do
          assert true
        end
      end
    end
  end
end

