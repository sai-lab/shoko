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

ActiveRecord::Schema.define(version: 20150303012227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: :cascade do |t|
    t.string   "title",      default: "",    null: false
    t.text     "markdown",   default: "",    null: false
    t.boolean  "draft_flag", default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "templates", force: :cascade do |t|
    t.string   "title",      default: "", null: false
    t.text     "markdown",   default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "user_documents", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "document_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_documents", ["document_id"], name: "index_user_documents_on_document_id", using: :btree
  add_index "user_documents", ["user_id"], name: "index_user_documents_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "account",            default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.string   "name",               default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["account"], name: "index_users_on_account", unique: true, using: :btree

  add_foreign_key "user_documents", "documents"
  add_foreign_key "user_documents", "users"
end
