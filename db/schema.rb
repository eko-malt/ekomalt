ActiveRecord::Schema.define(version: 20171125164605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inputs", force: :cascade do |t|
    t.date "date"
    t.bigint "provider_id"
    t.decimal "weightfact"
    t.decimal "weightdoc"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_inputs_on_provider_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gtype"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "login"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "inputs", "providers"
end
