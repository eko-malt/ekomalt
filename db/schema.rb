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

ActiveRecord::Schema.define(version: 20171213185854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bag_inputs", force: :cascade do |t|
    t.date "date"
    t.integer "amount"
    t.integer "size"
    t.bigint "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "remainder"
    t.index ["provider_id"], name: "index_bag_inputs_on_provider_id"
  end

  create_table "grain_inputs", force: :cascade do |t|
    t.date "date"
    t.bigint "provider_id"
    t.decimal "weight_fact"
    t.decimal "weight_doc"
    t.decimal "price"
    t.decimal "humidity"
    t.integer "sprouting"
    t.decimal "litter"
    t.decimal "nature"
    t.decimal "fall"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "remainder"
    t.index ["provider_id"], name: "index_grain_inputs_on_provider_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gtype"
  end

  create_table "settings", force: :cascade do |t|
    t.decimal "grain_storage_capacity"
    t.decimal "production_capacity"
    t.decimal "malt_storage_capacity"
    t.decimal "capital_coef"
    t.decimal "soak1_capacity"
    t.decimal "soak1_loading"
    t.decimal "soak2_capacity"
    t.decimal "soak2_loading"
    t.decimal "thresh1_capacity"
    t.decimal "thresh1_loading"
    t.decimal "thresh2_capacity"
    t.decimal "thresh2_loading"
    t.decimal "thresh3_capacity"
    t.decimal "thresh3_loading"
    t.decimal "dryer_capacity"
    t.decimal "dryer_loading"
    t.decimal "fermenter1_capacity"
    t.decimal "fermenter1_loading"
    t.decimal "fermenter2_capacity"
    t.decimal "fermenter2_loading"
    t.decimal "fermenter3_capacity"
    t.decimal "fermenter3_loading"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "login"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bag_inputs", "providers"
  add_foreign_key "grain_inputs", "providers"
end
