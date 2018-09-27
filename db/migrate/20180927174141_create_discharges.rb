class CreateDischarges < ActiveRecord::Migration[5.1]
  def change
    create_table :discharges do |t|
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
