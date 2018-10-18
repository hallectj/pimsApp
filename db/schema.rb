<<<<<<< HEAD
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180927174155) do

  create_table "admittances", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
  end

  create_table "bills", force: :cascade do |t|
    t.decimal "amount_paid"
    t.decimal "amount_owed"
    t.decimal "amount_insurance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "discharge_id"
  end

  create_table "charges", force: :cascade do |t|
    t.text "charge_name"
    t.decimal "charge_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bill_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "home_phone"
    t.string "work_phone"
    t.string "mobile_phone"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
  end

  create_table "discharges", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
  end

  create_table "dr_notes", force: :cascade do |t|
    t.string "name"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "treatment_id"
  end

  create_table "emergency_contacts", force: :cascade do |t|
    t.string "e1_name"
    t.string "e1_phone"
    t.string "e2_name"
    t.string "e2_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
  end

  create_table "insurances", force: :cascade do |t|
    t.string "policy_num"
    t.string "policy_name"
    t.string "group_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "facility"
    t.string "room"
    t.string "bed"
    t.integer "visitor_limit"
    t.text "approved_visitors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
  end

  create_table "n_notes", force: :cascade do |t|
    t.string "name"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "treatment_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "physicians", force: :cascade do |t|
    t.string "family_physician"
    t.string "physician_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "name"
    t.integer "amount"
    t.text "schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "treatment_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.text "schedule_msg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "treatment_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "superadmin_role", default: false
    t.boolean "doctor_role", default: false
    t.boolean "office_role", default: false
    t.boolean "volunteer_role", default: false
    t.boolean "medical_role", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
=======
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180927174146) do

  create_table "admittances", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.text "reason"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_admittances_on_patient_id"
  end

  create_table "bills", force: :cascade do |t|
    t.decimal "amount_paid"
    t.decimal "amount_owed"
    t.decimal "amount_insurance"
    t.integer "discharge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discharge_id"], name: "index_bills_on_discharge_id"
  end

  create_table "charges", force: :cascade do |t|
    t.text "charge_name"
    t.decimal "charge_amount"
    t.integer "bill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_charges_on_bill_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "home_phone"
    t.string "work_phone"
    t.string "mobile_phone"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_contacts_on_patient_id"
  end

  create_table "discharges", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_discharges_on_patient_id"
  end

  create_table "dr_notes", force: :cascade do |t|
    t.string "name"
    t.text "message"
    t.integer "treatment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["treatment_id"], name: "index_dr_notes_on_treatment_id"
  end

  create_table "emergency_contacts", force: :cascade do |t|
    t.string "e1_name"
    t.string "e1_phone"
    t.string "e2_name"
    t.string "e2_phone"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_emergency_contacts_on_patient_id"
  end

  create_table "insurances", force: :cascade do |t|
    t.string "policy_num"
    t.string "policy_name"
    t.string "group_num"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_insurances_on_patient_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "facility"
    t.string "room"
    t.string "bed"
    t.integer "visitor_limit"
    t.text "approved_visitors"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_locations_on_patient_id"
  end

  create_table "n_notes", force: :cascade do |t|
    t.string "name"
    t.text "message"
    t.integer "treatment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["treatment_id"], name: "index_n_notes_on_treatment_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "physicians", force: :cascade do |t|
    t.string "family_physician"
    t.string "physician_phone"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_physicians_on_patient_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "name"
    t.integer "amount"
    t.text "schedule"
    t.integer "treatment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["treatment_id"], name: "index_prescriptions_on_treatment_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.text "schedule_msg"
    t.integer "treatment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["treatment_id"], name: "index_schedules_on_treatment_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.string "name"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_treatments_on_patient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "superadmin_role", default: false
    t.boolean "doctor_role", default: false
    t.boolean "office_role", default: false
    t.boolean "volunteer_role"
    t.boolean "medical_role", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
>>>>>>> aa15606a576f77cae973f3bf50385f616b54e2b0
