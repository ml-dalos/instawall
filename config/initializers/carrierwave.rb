CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
    aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    region: Rails.application.credentials.aws[:region]
  }
  config.storage = :fog
  config.permissions = 0666
  config.cache_dir = "#{Rails.root}/tmp/"
  config.fog_directory = Rails.application.credentials.aws[:bucket]
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
end