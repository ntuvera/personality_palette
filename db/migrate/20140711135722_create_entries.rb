class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :user, index: true
      t.date :date
      t.string :event
      t.decimal :longitude
      t.decimal :latitude
      t.string :weather
      t.string :weather_img
      t.text :description
      t.references :emotion, index: true

      t.timestamps
    end
  end
end
