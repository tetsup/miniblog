class AttachedImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    ['jpg', 'jpeg', 'gif', 'png']
  end

  version :thumb do
    process resize_to_limit: [120, 120]
  end
end
