LinkedIn.configure do |config|
  config.token = Rails.application.secrets.linkedin_token 
  config.secret = Rails.application.secrets.linkedin_secret
end


