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
    
  end
end
