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

ActiveRecord::Schema.define(version: 20170426154323) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.integer  "postal_code"
    t.string   "city"
    t.integer  "number_of_person",    default: 1
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "mobile_phone_number"
    t.string   "street_name"
    t.integer  "street_number"
  end

  create_table "energy_prices", force: :cascade do |t|
    t.string   "energy_type"
    t.float    "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gite_id"
    t.index ["gite_id"], name: "index_events_on_gite_id"
  end

  create_table "gites", force: :cascade do |t|
    t.text     "title"
    t.text     "text1"
    t.text     "text2"
    t.text     "text3"
    t.text     "text4"
    t.text     "text5"
    t.text     "text6"
    t.text     "text7"
    t.text     "text8"
    t.text     "text9"
    t.string   "text10"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "image"
    t.string   "beds",            default: "--- []\n"
    t.integer  "bed_120x190",     default: 0
    t.integer  "bed_160x200",     default: 0
    t.integer  "bed_140x190",     default: 0
    t.integer  "bed_90x190",      default: 0
    t.integer  "bed_90x200",      default: 0
    t.integer  "armchair_90x190", default: 0
    t.string   "energy_type",     default: "electrical"
    t.integer  "cleaning_price",  default: 60
    t.index ["slug"], name: "index_gites_on_slug"
  end

  create_table "lease_agreements", force: :cascade do |t|
    t.integer  "reservation_id"
    t.string   "pdf_path"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["reservation_id"], name: "index_lease_agreements_on_reservation_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "from"
    t.datetime "to"
    t.integer  "client_id"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "gite_id"
    t.index ["client_id"], name: "index_reservations_on_client_id"
    t.index ["gite_id"], name: "index_reservations_on_gite_id"
  end

  create_table "tarifs", force: :cascade do |t|
    t.text     "year"
    t.text     "prixa1"
    t.text     "prixa2"
    t.text     "prixa3"
    t.text     "prixb1"
    t.text     "prixb2"
    t.text     "prixb3"
    t.text     "prixc1"
    t.text     "prixc2"
    t.text     "prixc3"
    t.text     "prixd1"
    t.text     "prixd2"
    t.text     "prixd3"
    t.text     "prixe1"
    t.text     "prixe2"
    t.text     "prixe3"
    t.text     "prixf1"
    t.text     "prixf2"
    t.text     "prixf3"
    t.text     "prixg1"
    t.text     "prixg2"
    t.text     "prixg3"
    t.text     "prixh1"
    t.text     "prixh2"
    t.text     "prixh3"
    t.text     "prixi1"
    t.text     "prixi2"
    t.text     "prixi3"
    t.text     "prixj1"
    t.text     "prixj2"
    t.text     "prixj3"
    t.text     "prixk1"
    t.text     "prixk2"
    t.text     "prixk3"
    t.text     "prixl1"
    t.text     "prixl2"
    t.text     "prixl3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
