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

ActiveRecord::Schema.define(version: 20151029204302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.integer  "curator_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "collections", ["curator_id"], name: "index_collections_on_curator_id", using: :btree

  create_table "curators", force: :cascade do |t|
    t.string   "uid"
    t.string   "username",                                                                         null: false
    t.string   "name"
    t.string   "photo",               default: "http://www.gravatar.com/avatar/?s=60&d=identicon"
    t.datetime "created_at",                                                                       null: false
    t.datetime "updated_at",                                                                       null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "observations", force: :cascade do |t|
    t.integer  "curator_id"
    t.integer  "collection_id"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "observations", ["collection_id"], name: "index_observations_on_collection_id", using: :btree
  add_index "observations", ["curator_id"], name: "index_observations_on_curator_id", using: :btree

  add_foreign_key "collections", "curators"
  add_foreign_key "observations", "collections"
  add_foreign_key "observations", "curators"
end
