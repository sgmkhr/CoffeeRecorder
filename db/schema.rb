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

ActiveRecord::Schema.define(version: 2024_07_11_101310) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "coffee_posts", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.string "name", null: false
    t.text "introduction", null: false
    t.boolean "online_sale", default: false, null: false
    t.integer "brewing", default: 0, null: false
    t.integer "roasting", default: 0, null: false
    t.integer "grind_size", default: 0, null: false
    t.integer "sweetness", default: 0, null: false
    t.integer "acidity", default: 0, null: false
    t.integer "bitterness", default: 0, null: false
    t.integer "strength", default: 0, null: false
    t.integer "aftertaste", default: 0, null: false
    t.text "supplement"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_coffee_posts_on_shop_id"
  end

  create_table "information_posts", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_information_posts_on_shop_id"
  end

  create_table "makers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "company_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_makers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_makers_on_reset_password_token", unique: true
  end

  create_table "records", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "coffee_name", null: false
    t.string "shop_name", null: false
    t.integer "scene", default: 0, null: false
    t.integer "brewing", default: 0, null: false
    t.integer "sweetness", default: 0, null: false
    t.integer "acidity", default: 0, null: false
    t.integer "bitterness", default: 0, null: false
    t.integer "strength", default: 0, null: false
    t.integer "aftertaste", default: 0, null: false
    t.text "impression"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.integer "maker_id", null: false
    t.string "name", null: false
    t.string "address"
    t.text "introduction"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["maker_id"], name: "index_shops_on_maker_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "coffee_posts", "shops"
  add_foreign_key "information_posts", "shops"
  add_foreign_key "records", "users"
  add_foreign_key "shops", "makers"
end
