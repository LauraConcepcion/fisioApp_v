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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110614075707) do

  create_table "clinicalhistories", :force => true do |t|
    t.date     "assessmentdate"
    t.text     "medicalhistory"
    t.text     "reasonconsultation"
    t.text     "evaluation"
    t.text     "treatment"
    t.string   "medicaldiagnosic"
    t.text     "physiotherapistdiagnostic"
    t.date     "startdatetto"
    t.date     "enddatetto"
    t.integer  "nsessions"
    t.integer  "frequency"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "paciente_id"
    t.integer  "code"
  end

  create_table "feetypes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "sessions"
    t.float    "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pacientes", :force => true do |t|
    t.string   "name"
    t.string   "firstsurname"
    t.string   "secondsurname"
    t.integer  "idtype"
    t.string   "idcode"
    t.string   "profession"
    t.integer  "feetype_id"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "birthdate"
    t.integer  "mobilephone"
    t.integer  "familyphone"
    t.integer  "homephone"
    t.string   "email"
    t.text     "addres"
    t.string   "zip"
    t.integer  "codigo"
  end

  create_table "tabs", :force => true do |t|
    t.string   "paciente_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "paciente_firstsurname"
    t.string   "paciente_secondsurname"
    t.string   "paciente_idcode"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
