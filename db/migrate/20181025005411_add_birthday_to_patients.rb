class AddBirthdayToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :birthday, :date
  end
end
