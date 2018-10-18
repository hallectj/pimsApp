class CreatePhysicians < ActiveRecord::Migration[5.1]
  def change
    create_table :physicians do |t|
      t.string :family_physician
      t.string :physician_phone
      t.references :patient
      t.timestamps
    end
  end
end
