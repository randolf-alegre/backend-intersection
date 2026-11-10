# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_11_10_055615) do
  create_table "establishment_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "establishments", force: :cascade do |t|
    t.string "name"
    t.integer "establishment_category_id"
    t.string "short"
    t.string "long"
    t.string "maps"
    t.string "string"
    t.string "cover_image"
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_category_id"], name: "index_establishments_on_establishment_category_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "keycard_token", null: false
    t.boolean "check_in_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "neighborhood_establishment_tables", force: :cascade do |t|
    t.integer "neighborhood_id", null: false
    t.integer "establishment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_id", "neighborhood_id"], name: "idx_unique_establishment_neighborhood", unique: true
    t.index ["establishment_id"], name: "index_neighborhood_establishment_tables_on_establishment_id"
    t.index ["neighborhood_id", "establishment_id"], name: "idx_unique_neighborhood_establishment", unique: true
    t.index ["neighborhood_id"], name: "index_neighborhood_establishment_tables_on_neighborhood_id"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
    t.string "hashtag"
    t.text "description"
    t.text "hashtag_description"
    t.string "city"
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "property_neighborhoods", id: false, force: :cascade do |t|
    t.integer "property_id", null: false
    t.integer "neighborhood_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["neighborhood_id", "property_id"], name: "idx_on_neighborhood_id_property_id_c29927daa4"
    t.index ["neighborhood_id", "property_id"], name: "idx_unique_neighborhood_property", unique: true
    t.index ["property_id", "neighborhood_id"], name: "idx_on_property_id_neighborhood_id_3683783964"
    t.index ["property_id", "neighborhood_id"], name: "idx_unique_property_neighborhood", unique: true
  end

  create_table "sessions", force: :cascade do |t|
    t.string "actor_type", null: false
    t.integer "actor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_type", "actor_id"], name: "index_sessions_on_actor"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "establishments", "establishment_categories"
  add_foreign_key "neighborhood_establishment_tables", "establishments"
  add_foreign_key "neighborhood_establishment_tables", "neighborhoods"
end
