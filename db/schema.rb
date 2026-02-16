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

ActiveRecord::Schema[7.1].define(version: 2026_02_16_061824) do
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

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.integer "release_year"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "publication_date"
    t.date "listened_on"
  end

  create_table "collection_items", force: :cascade do |t|
    t.integer "collection_id", null: false
    t.string "media_item_type", null: false
    t.integer "media_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_collection_items_on_collection_id"
    t.index ["media_item_type", "media_item_id"], name: "index_collection_items_on_media_item"
  end

  create_table "collections", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "comics", force: :cascade do |t|
    t.string "title"
    t.integer "issue_number"
    t.string "publisher"
    t.string "writer"
    t.string "artist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "publication_date"
    t.date "read_on"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "director"
    t.integer "release_year"
    t.string "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "publication_date"
    t.date "watched_on"
  end

  create_table "tv_shows", force: :cascade do |t|
    t.string "title"
    t.integer "season"
    t.integer "episode"
    t.string "network"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "publication_date"
    t.date "watched_on"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wrestling_events", force: :cascade do |t|
    t.string "title"
    t.string "promotion"
    t.date "date"
    t.string "venue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "watched_on"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "collection_items", "collections"
  add_foreign_key "collections", "users"
end
