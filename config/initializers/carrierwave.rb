if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['S3_KEY'],
      :aws_secret_access_key  => ENV['S3_SECRET'],
      :region                 => ENV['S3_REGION'],
      :host                   => ENV['S3_ASSET_URL']
    }
    config.fog_directory  = ENV['S3_BUCKET']
    config.fog_public     = false
    config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
  end
end
