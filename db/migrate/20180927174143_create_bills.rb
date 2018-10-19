class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.decimal :amount_paid
      t.decimal :amount_owed
      t.decimal :amount_insurance
      t.references :discharge
      t.timestamps
    end
  end
end
