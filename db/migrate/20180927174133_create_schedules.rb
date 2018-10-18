class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.date :date
      t.time :time
      t.text :schedule_msg
      t.references :treatment
      t.timestamps
    end
  end
end
