require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class WireTest < Test::Unit::TestCase
  context "Wire Model" do
    should 'construct new instance' do
      @wire = Wire.new
      assert_not_nil @wire
    end
  end
end
