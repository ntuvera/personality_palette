class EntriesController < ApplicationController
  def index
    @entries = User.find(params[:user_id]).entries.all
    # render json: @entries.to_json
  end

  def show
    @entry = User.find(params[:user_id]).Entry.find(params[:id])
  end

  def new
  end

  def create
    binding.pry
    Entry.create({event:params["event"], date:params["date"], emotion:params["emotion"], longitude:params["lon"], latitude:params["lat"], weather:params["weather_temp"], weather_img:params["weather_image"], description:params["desc"]})
    redirect_to entries_path

  end

  def show
    @entry = Entry.find(params[:id])
  end

end
