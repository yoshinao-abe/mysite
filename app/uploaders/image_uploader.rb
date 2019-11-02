class ImageUploader < CarrierWave::Uploader::Base
 # MiniMagickを有効にします
 include CarrierWave::MiniMagick
 
  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end
  

 # このアップローダーを利用した画像の最大数を指定します。
 process resize_to_fit: [200, 200]
 
  def store_dir
   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
 
 # 上記とは別にサムネイルを別サイズで用意します。
 version :thumb do
  process resize_to_fill: [40, 40]
 end
 
 def extension_white_list
  %w(jpg jpeg gif png)
 end
 
 
  def default_url
    "images.png"
  end
 
end