# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, '433592010474964', '547da79dec038a932f4c846986398f63'
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["FACEBOOK_CLIENT"], ENV["FACEBOOK_SECRET"], :scope => 'email, user_friends, manage_pages, pages_show_list'
  provider :google_oauth2, ENV["GOOGLE_API"], ENV["GOOGLE_SECRET"], scope: 'userinfo.profile,youtube,email', provider_ignores_state: true, prompt: :consent
  provider :twitter, ENV["TWITTER_CLIENT"], ENV["TWITTER_SECRET"]
end
  