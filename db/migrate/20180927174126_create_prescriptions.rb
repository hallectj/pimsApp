class CreatePrescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :prescriptions do |t|
      t.string :name
      t.integer :amount
      t.text :schedule

      t.timestamps
    end
  end
end
