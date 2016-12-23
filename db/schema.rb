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

ActiveRecord::Schema.define(version: 20161223035500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
  end

  create_table "curriculums", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "subtitle"
    t.text     "description"
    t.integer  "creator_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["creator_id"], name: "index_curriculums_on_creator_id", using: :btree
  end

  create_table "curriculums_resources", force: :cascade do |t|
    t.integer  "curriculum_id", null: false
    t.integer  "resource_id",   null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "order"
    t.index ["curriculum_id", "resource_id"], name: "index_curriculums_resources_on_curriculum_id_and_resource_id", unique: true, using: :btree
    t.index ["resource_id", "curriculum_id"], name: "index_curriculums_resources_on_resource_id_and_curriculum_id", using: :btree
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "rating"
    t.integer  "difficulty"
    t.integer  "completion_minutes"
    t.string   "feedbackable_type",  null: false
    t.integer  "feedbackable_id",    null: false
    t.integer  "user_id",            null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["feedbackable_type", "feedbackable_id", "user_id"], name: "feedbackable_user", unique: true, using: :btree
    t.index ["feedbackable_type", "feedbackable_id"], name: "index_feedbacks_on_feedbackable_type_and_feedbackable_id", using: :btree
    t.index ["user_id"], name: "index_feedbacks_on_user_id", using: :btree
  end

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.integer  "resource_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["resource_id"], name: "index_links_on_resource_id", using: :btree
  end

  create_table "resources", force: :cascade do |t|
    t.integer  "submitter_id"
    t.integer  "category_id"
    t.string   "title",        null: false
    t.text     "subtitle"
    t.text     "description"
    t.integer  "media_type"
    t.string   "credits"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["category_id"], name: "index_resources_on_category_id", using: :btree
    t.index ["submitter_id"], name: "index_resources_on_submitter_id", using: :btree
  end

  create_table "resources_tags", force: :cascade do |t|
    t.integer  "resource_id", null: false
    t.integer  "tag_id",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["resource_id", "tag_id"], name: "index_resources_tags_on_resource_id_and_tag_id", unique: true, using: :btree
    t.index ["tag_id", "resource_id"], name: "index_resources_tags_on_tag_id_and_resource_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username",                            null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "links", "resources"
end
