class CreateEmotions < ActiveRecord::Migration
  def change
    create_table :emotions do |t|
      t.references :entry, index: true
      t.string :type
      t.integer :intensity

      t.timestamps
    end
  end
end
