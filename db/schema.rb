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

ActiveRecord::Schema.define(version: 20170322194531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_stores", force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "author"
    t.string   "title"
    t.text     "content"
    t.string   "article_image_file_name"
    t.string   "article_image_content_type"
    t.integer  "article_image_file_size"
    t.datetime "article_image_updated_at"
    t.integer  "tag_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "content"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
  end

  create_table "designer_stores", force: :cascade do |t|
    t.integer "store_id"
    t.integer "designer_id"
  end

  create_table "designers", force: :cascade do |t|
    t.string   "designer_name"
    t.text     "about"
    t.string   "designer_image_file_name"
    t.string   "designer_image_content_type"
    t.integer  "designer_image_file_size"
    t.datetime "designer_image_updated_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "topic_id"
    t.string   "post_image_file_name"
    t.string   "post_image_content_type"
    t.integer  "post_image_file_size"
    t.datetime "post_image_updated_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "store_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_announcements", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "store_id"
    t.string   "announcement_image_file_name"
    t.string   "announcement_image_content_type"
    t.integer  "announcement_image_file_size"
    t.datetime "announcement_image_updated_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string   "store_name"
    t.text     "about"
    t.string   "store_image_file_name"
    t.string   "store_image_content_type"
    t.integer  "store_image_file_size"
    t.datetime "store_image_updated_at"
    t.string   "street_address"
    t.string   "zip"
    t.string   "phone"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "topic_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_stores", force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
