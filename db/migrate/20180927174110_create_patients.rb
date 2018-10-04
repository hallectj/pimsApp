class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.date :birthday

      t.timestamps
    end
  end
end
