class Entry < ActiveRecord::Base
  belongs_to :user
# refactor as an each
  def self.data_to_array(params)
    @colors = []
    @user = User.find(params[:user_id])

    # logs total number of hits for an emotion... incorporate into table for data report?
    # @silvers = @user.entries.where(emotion_num:"0").count('date', :distinct => true)
    # @reds = @user.entries.where(emotion_num:"1").count('date', :distinct => true)
    # @oranges = @user.entries.where(emotion_num:"2").count('date', :distinct => true)
    # @yellows = @user.entries.where(emotion_num:"3").count('date', :distinct => true)
    # @greens = @user.entries.where(emotion_num:"4").count('date', :distinct => true)
    # @blues = @user.entries.where(emotion_num:"5").count('date', :distinct => true)
    # @purples = @user.entries.where(emotion_num:"6").count('date', :distinct => true)
    # @colors.push(@silvers, @reds, @oranges, @yellows, @greens, @blues, @purples)

    previous_dates = []

    @user.entries.select(:date).uniq.each do |entry|
      previous_dates.push(entry.date)
    end

    previous_dates.sort

    # need loop for previous days
    # dates = previous_dates.last
    dates = previous_dates.slice(0,6)
    binding.pry

    @data = []
    guide_line = [
    ['0%', '#808080'],
    ['15%', '#FF0000'],
    ['30%', '#FFA500'],
    ['45%', '#FFFF00'],
    ['60%', '#00FF00'],
    ['75%', '#0000FF'],
    ['90%', '#4B0082']]

    dates.each do |date|
      @user.entries.where(date:dates).each do |entry|
        if entry.emotion_num =="0"
          @data.push(guide_line[0])
        elsif entry.emotion_num =="1"
          @data.push(guide_line[1])
        elsif entry.emotion_num =="2"
          @data.push(guide_line[2])
        elsif entry.emotion_num =="3"
          @data.push(guide_line[3])
        elsif entry.emotion_num =="4"
          @data.push(guide_line[4])
        elsif entry.emotion_num =="5"
          @data.push(guide_line[5])
        else entry.emotion_num =="6"
          @data.push(guide_line[6])
        end
      end
    end

    @data.sort!



      return @data
  end

end
