class PatientReference < ActiveRecord::Migration[5.1]
  def change
    add_column  :physicians, :patient_id, :integer
    add_column  :emergency_contacts, :patient_id, :integer
    add_column  :contacts, :patient_id, :integer
    add_column  :locations, :patient_id, :integer
    add_column  :admittances, :patient_id, :integer
    add_column  :discharges, :patient_id, :integer
    add_column  :insurances, :patient_id, :integer
    add_column  :treatments, :patient_id, :integer    
  end
end
