class AddEmotionnumToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :emotion_num, :integer
  end
end
