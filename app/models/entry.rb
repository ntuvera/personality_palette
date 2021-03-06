class Entry < ActiveRecord::Base
  belongs_to :user

  validates :event, presence: true
  validates :date, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :weather, presence: true
  validates :weather_img, presence: true
  validates :emotion, presence: true
  validates :description, presence: true


  def self.data_to_array(params)
    @colors = []
    @user = User.find(params[:user_id])

    # logs total number of hits for an emotion... saved for future feature
    # @silvers = @user.entries.where(emotion_num:"0").count('date', :distinct => true)
    # @reds = @user.entries.where(emotion_num:"1").count('date', :distinct => true)
    # @oranges = @user.entries.where(emotion_num:"2").count('date', :distinct => true)
    # @yellows = @user.entries.where(emotion_num:"3").count('date', :distinct => true)
    # @greens = @user.entries.where(emotion_num:"4").count('date', :distinct => true)
    # @blues = @user.entries.where(emotion_num:"5").count('date', :distinct => true)
    # @purples = @user.entries.where(emotion_num:"6").count('date', :distinct => true)
    # @colors.push(@silvers, @reds, @oranges, @yellows, @greens, @blues, @purples)

    previous_dates = []
    @user.entries.select(:date).uniq.limit(7).each do |entry|
      previous_dates.push(entry.date)
    end

    dates = previous_dates.sort!

    guide_line = [
    ['0%', '#808080'],
    ['15%', '#FF0000'],
    ['30%', '#FFA500'],
    ['45%', '#FFFF00'],
    ['60%', '#00FF00'],
    ['75%', '#0000FF'],
    ['90%', '#4B0082']]

    @data = []
    date_arr = []

    # for data in dates
    dates.each do |date|
      @user.entries.where(date:date).each do |entry|
        if entry.emotion_num =="0"
          date_arr.push(guide_line[0])
        elsif entry.emotion_num =="1"
          date_arr.push(guide_line[1])
        elsif entry.emotion_num =="2"
          date_arr.push(guide_line[2])
        elsif entry.emotion_num =="3"
          date_arr.push(guide_line[3])
        elsif entry.emotion_num =="4"
          date_arr.push(guide_line[4])
        elsif entry.emotion_num =="5"
          date_arr.push(guide_line[5])
        else entry.emotion_num =="6"
          date_arr.push(guide_line[6])
        end
      end
      date_arr.sort!
      @data.push(date_arr)
      date_arr = []
    end
    return @data
  end

  def self.color_key
    color_guide_line = [
    ['Neutral', 'rgba(0,0,0,0.2)'],
    ['Angry', 'rgba(255,0,0,0.8)'],
    ['Afraid', 'rgba(255,201,0,0.8)'],
    ['Surprised', 'rgba(255,255,0,0.8)'],
    ['Happy', 'rgba(0,255,0,0.8)'],
    ['Sad', 'rgba(0,0,255,0.6)'],
    ['Disgusted', 'rgba(75,0,150,0.7)']]
  end
end
