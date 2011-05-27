require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ImageUploaderTest < Test::Unit::TestCase
  context "ImageUploader" do

    should 'construct new instance' do
      @uploader = ImageUploader.new
      assert_not_nil @uploader
    end

    # I'm going to comment this out for now, because I am not sure how to
    # delete the uploaded file and it'll be filling up the database with 
    # Charlton Heston until my machine is destroyed :).
    #
    # should "allow image upload" do
    #   @uploader = ImageUploader.new 
    #   path = PADRINO_ROOT + "/test/fixtures/omegaman.jpg"
    #   file = File.new(path)
    #   @uploader.store!(file)
    #   assert_equal("omegaman.jpg", @uploader.filename)
    # end
    
  end
end
