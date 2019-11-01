if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_directory = ENV['AWS_S3_BUCKET']
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['AWS_S3_REGION'],     # 例: 'ap-northeast-1'
      :aws_access_key_id     => ENV['AWS_S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['AWS_S3_SECRET_KEY']
    }
  config.fog_public     = false                                                 # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}

  end
end