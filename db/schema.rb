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

ActiveRecord::Schema[7.1].define(version: 2024_03_26_165055) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "budgets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "hoa_id", null: false
    t.integer "year"
    t.integer "amount_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hoa_id"], name: "index_budgets_on_hoa_id"
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

  create_table "hoas", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.text "street"
    t.string "zip"
    t.string "town"
    t.string "country"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hoas_on_user_id"
  end

  create_table "lots", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "hoa_id", null: false
    t.integer "number"
    t.text "description"
    t.text "street"
    t.string "zip"
    t.string "town"
    t.string "country"
    t.integer "surface"
    t.integer "shares"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hoa_id"], name: "index_lots_on_hoa_id"
    t.index ["user_id"], name: "index_lots_on_user_id"
  end

  create_table "mandats", force: :cascade do |t|
    t.integer "hoa_id", null: false
    t.string "sexe"
    t.string "name"
    t.text "street"
    t.string "zip"
    t.string "town"
    t.string "country"
    t.string "email"
    t.string "phone"
    t.string "job"
    t.date "since_at"
    t.date "until_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hoa_id"], name: "index_mandats_on_hoa_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.integer "hoa_id", null: false
    t.string "name"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hoa_id"], name: "index_meetings_on_hoa_id"
  end

  create_table "owners", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "status"
    t.text "street"
    t.string "zip"
    t.string "town"
    t.string "country"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_owners_on_user_id"
  end

  create_table "ownerships", force: :cascade do |t|
    t.integer "owner_id", null: false
    t.integer "lot_id", null: false
    t.date "since_at"
    t.date "until_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "splitting"
    t.index ["lot_id"], name: "index_ownerships_on_lot_id"
    t.index ["owner_id"], name: "index_ownerships_on_owner_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "budget_id", null: false
    t.integer "owner_id", null: false
    t.integer "lot_id", null: false
    t.date "paid_at"
    t.string "mean"
    t.integer "amount_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_payments_on_budget_id"
    t.index ["lot_id"], name: "index_payments_on_lot_id"
    t.index ["owner_id"], name: "index_payments_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "last_sign_in_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "budgets", "hoas"
  add_foreign_key "budgets", "users"
  add_foreign_key "hoas", "users"
  add_foreign_key "lots", "hoas"
  add_foreign_key "lots", "users"
  add_foreign_key "mandats", "hoas"
  add_foreign_key "meetings", "hoas"
  add_foreign_key "owners", "users"
  add_foreign_key "ownerships", "lots"
  add_foreign_key "ownerships", "owners"
  add_foreign_key "payments", "budgets"
  add_foreign_key "payments", "lots"
  add_foreign_key "payments", "owners"
end
