class AttachedImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def extension_whitelist
    ['jpg', 'jpeg', 'gif', 'png']
  end

  process resize_to_limit: [640, 640]
  version :thumb do
    process resize_to_limit: [120, 120]
  end
end
