# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token, null: false, default: ""
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Add roles to users
      t.boolean :superadmin_role, default: false
      t.boolean :doctor_role, default: false 
      t.boolean :office_role, default: false
      t.boolean :volunteer_role, dafault: false
      t.boolean :medical_role, default: false
      

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
    
    
    
        # Initialize first account:
<<<<<<< HEAD
    #User.create! do |u|
    #    u.email     = 'test@test.com'
    #    u.password    = 'password'
    #    u.password_confirmation = 'password'
        
=======
    User.create! do |u|
        u.email     = 'test@test.com'
        u.password    = 'password'
        u.superadmin_role = true
>>>>>>> e6d564212140ed0df70b84a3b5898683be625b44
    end
    
  end
end
