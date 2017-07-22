class CoverArtUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :medium do
    process resize_to_limit: [300, 300]
  end

  version :thumb, :from_version => :medium do
    process resize_to_fit: [100, 100]
  end
end
