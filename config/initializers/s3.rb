CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AMAZON_S3_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AMAZON_S3_ACCESS_KEY_SECRET'],
    region:                ENV['AMAZON_S3_REGION']
  }
  config.fog_directory  = 'jackpearson'
end
