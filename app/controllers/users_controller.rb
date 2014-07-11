class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to log_in_path
    else
      render 'new'
    end
  end

  def show
    @users = User.all
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
