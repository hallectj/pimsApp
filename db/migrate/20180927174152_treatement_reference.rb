class TreatementReference < ActiveRecord::Migration[5.1]
  def change
    add_column  :schedules, :treatment_id, :integer
    add_column  :prescriptions, :treatment_id, :integer
    add_column  :dr_notes, :treatment_id, :integer
    add_column  :n_notes, :treatment_id, :integer    
  end
end
