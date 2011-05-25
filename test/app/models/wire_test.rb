require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class WireTest < Test::Unit::TestCase
  context "Wire Model" do
    should 'construct new instance' do
      @wire = Wire.new
      assert_not_nil @wire
    end
    
    should "validate presence of name" do
      @wire = Wire.make
      assert @wire.valid?
      @wire.name = ""
      assert !@wire.valid?
      @wire.name = nil
      assert !@wire.valid?
    end

    context "feed_items method" do
      setup do
        @wire = Factory.make_wire_with_feed_items
      end

      should "return an array of FeedItems for itself" #do
      #   assert_equal(5, @wire.feed_items.length)
      # end
    end
    
  end
end
