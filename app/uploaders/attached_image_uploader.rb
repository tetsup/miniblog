class AttachedImageUploader < CarrierWave::Uploader::Base
  if Rails.env.production?
    include Cloudinary::CarrierWave
  else
    include CarrierWave::RMagick
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    ['jpg', 'jpeg', 'gif', 'png']
  end

  process resize_to_limit: [640, 640]
  version :thumb do
    process resize_to_limit: [120, 120]
  end
end
