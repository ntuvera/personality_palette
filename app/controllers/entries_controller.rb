class EntriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @entries = User.find(params[:user_id]).entries.all
    # render json: @entries.to_json
  end

  def show
    @user = User.find(params[:user_id])
    @entry = User.find(params[:user_id]).Entry.find(params[:id])
  end

  def new
    @user = User.find(session[:user_id])
    @entry = Entry.new
  end

  def create
    entry = Entry.create(entry_params)
    binding.pry
  end

  def show
    @entry = Entry.find(params[:id])
  end

  private
  def entry_params
    params.require(:entry).permit(:user_id, :date, :event, :emotion, :longitude, :latitude, :weather, :weather_img, :description)
  end

end
