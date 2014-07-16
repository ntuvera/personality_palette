class EntriesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @entries = User.find(params[:user_id]).entries.order('created_at DESC').limit(9)
    @data = Entry.data_to_array(params)
    @color_key = Entry.color_key
  end


  def show
    @entry = Entry.find(params[:id])
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
    @user = User.find(params[:user_id])
    @entry = Entry.find(params[:id])
  end

  def edit
    entry = User.find(params[:user_id]).entries.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    edited_entry = User.find(params[:user_id]).entries.find(params[:id])
    edited_entry.update(entry_params)
    redirect_to "/users/#{user.id}/entries"
  end

  def destroy
    @entry = User.find(params[:user_id]).entries.find(params[:id])
    @entry.delete
    redirect_to user_entries_path
  end
  private
  def entry_params
    params.require(:entry).permit(:user_id, :date, :event, :emotion, :emotion_num, :longitude, :latitude, :weather, :weather_img, :description)
  end

end
