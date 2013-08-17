CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AKI'],
      :aws_secret_access_key  => ENV['ASK'],
      :region                 => 'eu-west-1'
  }
  config.fog_directory  = ENV['ASD'] # bucket name
  config.fog_public = true
  config.will_include_content_type = true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  config.asset_host = ENV['ASSET_HOST']
end