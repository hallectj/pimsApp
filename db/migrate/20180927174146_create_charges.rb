class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.text :charge_name
      t.decimal :charge_amount
      t.references :bill
      t.timestamps
    end
  end
end
