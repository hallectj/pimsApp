class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :home_phone
      t.string :work_phone
      t.string :mobile_phone
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.references :patient
      t.timestamps
    end
  end
end
