class AddEmotionToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :emotion, :string
  end
end
