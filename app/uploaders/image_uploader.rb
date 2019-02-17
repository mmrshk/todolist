class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    Rails.env.production? ? (primary_folder = 'production') : (primary_folder = 'test')

   "#{primary_folder}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
  %w[jpg jpeg png]
  end
end
