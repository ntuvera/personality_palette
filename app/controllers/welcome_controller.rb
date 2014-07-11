class WelcomeController < ApplicationController

  before_action:current_user

  def index
    @user = User.find(session[:user_id]) if session[:user_id]
    @users = User.all
    current_user = @user
  end

end
