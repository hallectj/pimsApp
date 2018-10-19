class CreateEmergencyContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :emergency_contacts do |t|
      t.string :e1_name
      t.string :e1_phone
      t.string :e2_name
      t.string :e2_phone
      t.references :patient
      t.timestamps
    end
  end
end
