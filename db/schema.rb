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

ActiveRecord::Schema.define(version: 2021_11_12_121341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "timeline_id"
    t.bigint "user_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timeline_id"], name: "index_comments_on_timeline_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "timeline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timeline_id"], name: "index_favorites_on_timeline_id"
    t.index ["user_id", "timeline_id"], name: "index_favorites_on_user_id_and_timeline_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "follower_id", null: false
    t.bigint "followed_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id", "followed_user_id"], name: "index_follows_on_follower_id_and_followed_user_id", unique: true
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "timelines", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "attached_image_path"
    t.index ["user_id"], name: "index_timelines_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "profile", default: ""
    t.string "url", default: ""
    t.string "email", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "comments", "timelines"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "timelines"
  add_foreign_key "favorites", "users"
  add_foreign_key "follows", "users", column: "followed_user_id"
  add_foreign_key "follows", "users", column: "follower_id"
  add_foreign_key "timelines", "users"
end
