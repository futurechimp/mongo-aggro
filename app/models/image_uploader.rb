class ImageUploader < CarrierWave::Uploader::Base

  storage :grid_fs
  
  ##
  # Image manipulator library:
  #
  # include CarrierWave::RMagick
  # include CarrierWave::ImageScience
  include CarrierWave::MiniMagick

  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  ##
  # Store temporary image downloads in a top-level tmp folder.
  #
  def cache_dir
    File.dirname(__FILE__) + '/../../tmp'
  end

  ##
  # Default URL as a default if there hasn't been a file uploaded
  #
  def default_url
    if model.is_a?(FeedItem)
      "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    end
  end

  ##
  # Process files as they are uploaded.
  #
  version :chopped do
    process :resize_to_fill => [300, 300]
  end

  version :small do
    process :resize_to_fill => [140, 140]
  end
  
  ##
  # Create different versions of your uploaded files
  #
  # version :header do
  #   process :resize_to_fill => [940, 250]
  #   version :thumb do
  #     process :resize_to_fill => [230, 85]
  #   end
  # end
  ##
  # White list of extensions which are allowed to be uploaded:
  #
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  ##
  # Override the filename of the uploaded files
  #
  # def filename
  #   "something.jpg" if original_filename
  # end

end