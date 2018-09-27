class CreateAdmittances < ActiveRecord::Migration[5.1]
  def change
    create_table :admittances do |t|
      t.date :date
      t.time :time
      t.text :reason

      t.timestamps
    end
  end
end
