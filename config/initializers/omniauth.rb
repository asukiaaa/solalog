Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APPID'], ENV['FACEBOOK_SECRET'],
    scope: 'email', display: :popup
end
