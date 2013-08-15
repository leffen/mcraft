CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AKI'],
      :aws_secret_access_key  => ENV['ASK'],
      :region                 => 'eu-west-1'
  }
  config.fog_directory  = ENV['ASD'] # bucket name
  config.will_include_content_type = true
end