class ChangeEmotionNumFormatInEntries < ActiveRecord::Migration
  def change
    change_column :entries, :emotion_num, :string
  end
end
