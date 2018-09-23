class AddRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :superadmin_role, :boolean, default: false
    add_column :users, :doctor_role, :boolean, default: false
    add_column :users, :office_role, :boolean, default: false
    add_column :users, :volunteer_role, :boolean, default: false
    add_column :users, :medical_role, :boolean, default: false
  end
end
