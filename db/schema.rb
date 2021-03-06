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

ActiveRecord::Schema.define(version: 20160806173907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_memberships", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "group_id",   null: false
    t.boolean  "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_memberships_on_group_id", using: :btree
    t.index ["user_id", "group_id"], name: "index_group_memberships_on_user_id_and_group_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_group_memberships_on_user_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_groups_on_name", unique: true, using: :btree
    t.index ["slug"], name: "index_groups_on_slug", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "email",                        null: false
    t.string   "password_digest",              null: false
    t.string   "access_token"
    t.string   "token"
    t.jsonb    "preferences",     default: {}
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["access_token"], name: "index_users_on_access_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["token"], name: "index_users_on_token", unique: true, using: :btree
  end

  add_foreign_key "group_memberships", "groups"
  add_foreign_key "group_memberships", "users"
end
