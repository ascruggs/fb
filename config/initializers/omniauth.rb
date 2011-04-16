Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '219461168071118', '40f66e3a471361da450c10d7c271773f', {:scope => 'publish_stream,offline_access,email'}
end