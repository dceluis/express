CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
    :region                 => 'sa-east-1'
  }
  config.fog_directory  = 'express-link'
  config.fog_public     = false
  config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
end
