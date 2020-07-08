# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_08_174532) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "badges", force: :cascade do |t|
    t.string "name", null: false
    t.string "notes", null: false
    t.decimal "reward", precision: 8, scale: 2, null: false
    t.integer "created_by"
    t.integer "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_badges_on_name", unique: true
  end

  create_table "requests", force: :cascade do |t|
    t.integer "requestor_id", null: false
    t.integer "recipient_id", null: false
    t.integer "badge_id", null: false
    t.text "reason", null: false
    t.integer "strive_category_id", null: false
    t.integer "backer_id", null: false
    t.integer "requestee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["backer_id"], name: "index_requests_on_backer_id"
    t.index ["badge_id"], name: "index_requests_on_badge_id"
    t.index ["recipient_id"], name: "index_requests_on_recipient_id"
    t.index ["requestee_id"], name: "index_requests_on_requestee_id"
    t.index ["requestor_id"], name: "index_requests_on_requestor_id"
    t.index ["strive_category_id"], name: "index_requests_on_strive_category_id"
  end

  create_table "strive_categories", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "updated_by"
    t.integer "created_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_strive_categories_on_name", unique: true
  end

  create_table "strives", force: :cascade do |t|
    t.integer "awarder_id", null: false
    t.integer "awardee_id", null: false
    t.integer "badge_id", null: false
    t.integer "strive_category_id", null: false
    t.text "reason", null: false
    t.integer "request_id"
    t.boolean "cashed_out", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["awardee_id"], name: "index_strives_on_awardee_id"
    t.index ["awarder_id"], name: "index_strives_on_awarder_id"
    t.index ["badge_id"], name: "index_strives_on_badge_id"
    t.index ["cashed_out"], name: "index_strives_on_cashed_out"
    t.index ["reason"], name: "index_strives_on_reason"
    t.index ["request_id"], name: "index_strives_on_request_id", unique: true
    t.index ["strive_category_id"], name: "index_strives_on_strive_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin"
    t.boolean "active"
    t.string "name"
    t.integer "role"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
