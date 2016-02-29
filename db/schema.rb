# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160229012716) do

  create_table "genres", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_items", id: false, force: :cascade do |t|
    t.integer "item_id"
    t.integer "genre_id"
  end

  add_index "genres_items", ["genre_id"], name: "index_genres_items_on_genre_id"
  add_index "genres_items", ["item_id"], name: "index_genres_items_on_item_id"

  create_table "items", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "alt_title"
    t.text     "info"
    t.string   "episodes",   null: false
    t.integer  "discs",      null: false
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "front_uid"
    t.string   "back_uid"
  end

  add_index "items", ["id"], name: "index_items_on_item_id", unique: true
  add_index "items", ["title"], name: "index_items_on_item_title"

  create_table "items_languages", id: false, force: :cascade do |t|
    t.integer "item_id"
    t.integer "language_id"
  end

  add_index "items_languages", ["item_id"], name: "index_items_languages_on_item_id"
  add_index "items_languages", ["language_id"], name: "index_items_languages_on_language_id"

  create_table "languages", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "storage_chunks", force: :cascade do |t|
    t.integer "file_id"
    t.integer "idx"
    t.binary  "encoded_data"
  end

  add_index "storage_chunks", ["file_id"], name: "index_storage_chunks_on_file_id"

  create_table "storage_files", force: :cascade do |t|
    t.text     "metadata"
    t.datetime "accessed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
