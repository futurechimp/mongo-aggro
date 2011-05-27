class ImageUploader < CarrierWave::Uploader::Base

  storage :grid_fs

end