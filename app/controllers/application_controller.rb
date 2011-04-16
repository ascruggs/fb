class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def facebook_auth
    user_omniauth_authorize_path(:facebook)
  end
  
end
