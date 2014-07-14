class Entry < ActiveRecord::Base
  belongs_to :user
# refactor as an each
  def self.data_to_array(params)
    @colors = []
    @user = User.find(params[:user_id])
    @silvers = @user.entries.where(emotion_num:"0").count('date', :distinct => true)
    @reds = @user.entries.where(emotion_num:"1").count('date', :distinct => true)
    @oranges = @user.entries.where(emotion_num:"2").count('date', :distinct => true)
    @yellows = @user.entries.where(emotion_num:"3").count('date', :distinct => true)
    @greens = @user.entries.where(emotion_num:"4").count('date', :distinct => true)
    @blues = @user.entries.where(emotion_num:"5").count('date', :distinct => true)
    @purples = @user.entries.where(emotion_num:"6").count('date', :distinct => true)

    @colors.push(@silvers, @reds, @oranges, @yellows, @greens, @blues, @purples)

    previous_entries = []
    @user.entries.select(:date).uniq.each do |entry|
      previous_entries.push(entry.date)
    end

    date = previous_entries[0]
    test = []
    emotion_arr = [0, 0, 0, 0, 0, 0, 0]

    test.each do |entry|
      test.push(entry.emotion_num.to_i)
        test.each do |t|
         emotion_arr.push(t.emotion_num.to_i)
        end
    end

    @user.entries.where(date:date).each do |entry|
      if entry.emotion_num =="0"
        emotion_arr[0] += 1
      elsif entry.emotion_num =="1"
        emotion_arr[1] += 1
      elsif entry.emotion_num =="2"
        emotion_arr[2] += 1
      elsif entry.emotion_num =="3"
        emotion_arr[3] += 1
      elsif entry.emotion_num =="4"
        emotion_arr[4] += 1
      elsif entry.emotion_num =="5"
        emotion_arr[5] += 1
      elsif entry.emotion_num =="6"
        emotion_arr[6] += 1
      end
    end
    binding.pry

  end

end
