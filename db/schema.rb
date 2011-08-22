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

ActiveRecord::Schema.define(:version => 20110822134819) do

  create_table "centers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clinicalhistories", :force => true do |t|
    t.string   "assessmentdate"
    t.string   "medicalhistory"
    t.string   "reasonconsultation"
    t.string   "evaluation"
    t.string   "treatment"
    t.string   "medicaldiagnosic"
    t.string   "physiotherapistdiagnostic"
    t.string   "startdatetto"
    t.string   "enddatetto"
    t.integer  "nsessions"
    t.integer  "frequency"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "paciente_id"
    t.integer  "code"
    t.string   "expedient"
    t.string   "authorization"
    t.string   "authorizationcomments"
    t.integer  "rate_id"
    t.integer  "provenance_id"
    t.integer  "center_id"
    t.integer  "specialist_id"
    t.integer  "specialisttype_id"
  end

  create_table "countreferences", :force => true do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "all_day"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "center_id"
    t.integer  "specialist_id"
    t.boolean  "attended"
    t.integer  "paciente_id"
    t.integer  "invoiceline_id"
    t.integer  "clinicalhistory_id"
    t.string   "name"
    t.string   "firstsurname"
    t.string   "secondsurname"
  end

  create_table "feetypes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "sessions"
    t.float    "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "provenance_id"
  end

  create_table "idtypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoiceheads", :force => true do |t|
    t.string   "name"
    t.string   "firstsurname"
    t.string   "secondsurname"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "paciente_id"
  end

  create_table "invoicelines", :force => true do |t|
    t.integer  "linenumber"
    t.string   "concept"
    t.integer  "sessions"
    t.float    "price"
    t.float    "total"
    t.integer  "invoicehead_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "treatmentdate"
  end

  create_table "pacientes", :force => true do |t|
    t.string   "name"
    t.string   "firstsurname"
    t.string   "secondsurname"
    t.integer  "idtype"
    t.string   "idcode"
    t.string   "profession"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "birthdate"
    t.integer  "mobilephone"
    t.integer  "familyphone"
    t.integer  "homephone"
    t.string   "email"
    t.string   "addres"
    t.string   "zip"
    t.integer  "codigo"
    t.integer  "idtype_id"
  end

  create_table "provenances", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "sessions"
    t.float    "rate"
    t.integer  "provenance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialists", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone1"
    t.integer  "phone2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "specialisttype_id"
  end

  create_table "specialisttypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
