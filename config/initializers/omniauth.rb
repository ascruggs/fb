Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 'APP_ID', 'APP_SECRET'  # Find these values on the Facebook App page
end