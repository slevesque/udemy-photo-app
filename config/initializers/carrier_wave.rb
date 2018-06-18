require 'carrierwave/storage/abstract' # Add this line <<<<<
require 'carrierwave/storage/file' # Add this line <<<<<
require 'carrierwave/storage/fog' # Add this line <<<<<

if Rails.env.production?
  logger.debug('WE PASSS HERE')
  CarrierWave.configure do |config|
    config.storage = :fog # Add this line <<<<<

    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY']
    }
    config.fog_directory = ENV['S3_BUCKET']
  end
end
