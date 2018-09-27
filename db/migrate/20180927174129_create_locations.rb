class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :facility
      t.string :room
      t.string :bed
      t.integer :visitor_limit
      t.text :approved_visitors

      t.timestamps
    end
  end
end
