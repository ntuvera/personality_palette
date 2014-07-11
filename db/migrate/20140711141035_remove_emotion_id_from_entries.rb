class RemoveEmotionIdFromEntries < ActiveRecord::Migration
  def change
    remove_reference :entries, :emotion, index: true
  end
end
