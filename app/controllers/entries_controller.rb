class EntriesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @entries = User.find(params[:user_id]).entries.order('created_at DESC').limit(9)
    @data = Entry.data_to_array(params)
  end


  def show
    redirect_to entries_user_path(@user.id)
  end

  def new
    @user = User.find(session[:user_id])
    @entry = Entry.new
  end

  def create
    entry = Entry.create(entry_params)
    redirect_to user_entries_path
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def edit
    @entry = Entry.find(params[:id])
    Entry.update(entry_params)
    Entry.save
  end

  private
  def entry_params
    params.require(:entry).permit(:user_id, :date, :event, :emotion, :emotion_num, :longitude, :latitude, :weather, :weather_img, :description)
  end

end
