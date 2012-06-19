CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJSDAJ7IRKPPMZHTA',
    :aws_secret_access_key  => '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',

  }
  config.fog_host       "https://s3.amazonaws.com/aya_images"
  config.fog_directory  = 'aya_images'
  config.fog_public     = true
end