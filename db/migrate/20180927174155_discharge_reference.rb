class DischargeReference < ActiveRecord::Migration[5.1]
  def change
    add_column  :bills, :discharge_id, :integer
    add_column  :charges, :bill_id, :integer    
  end
end
