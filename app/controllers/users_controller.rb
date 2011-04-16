class UsersController < ApplicationController
  
  def index
    @info = env["omniauth.auth"]
  end
end
