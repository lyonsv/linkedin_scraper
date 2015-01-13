class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      sign_in user
      #sign in redirect
      redirect_to root_path 
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to  new_user_registration_url
    end
  end
  alias_method :linkedin, :all
end
