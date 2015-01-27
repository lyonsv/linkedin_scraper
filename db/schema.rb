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

ActiveRecord::Schema.define(version: 20150119223620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "title"
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "linkedin_company_url"
    t.string   "website"
    t.string   "industry"
    t.string   "type"
    t.string   "headquarters"
    t.string   "company_size"
    t.string   "founded"
    t.string   "address"
    t.integer  "contact_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.boolean  "current_company"
  end

  add_index "companies", ["contact_id"], name: "index_companies_on_contact_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.text     "notes"
    t.string   "headline"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.text     "summary"
    t.string   "location"
    t.string   "country"
    t.string   "industry"
    t.string   "picture_url"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "linkedin_url"
    t.string   "github_username"
    t.string   "github_avatar_url"
    t.string   "github_url"
    t.string   "github_html_url"
    t.string   "github_followers_url"
    t.string   "github_following_url"
    t.string   "gists_url"
    t.string   "starred_url"
    t.string   "subscriptions_url"
    t.string   "organizations_url"
    t.string   "repos_url"
    t.string   "events_url"
    t.string   "received_events_url"
    t.string   "github_name"
    t.string   "github_company"
    t.string   "github_blog"
    t.string   "github_location"
    t.string   "github_email"
    t.boolean  "github_hireable"
    t.string   "github_bio"
    t.integer  "number_of_repos"
    t.integer  "number_of_gists"
    t.integer  "github_followers"
    t.integer  "github_following"
  end

  create_table "educations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "period"
    t.integer  "contact_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "educations", ["contact_id"], name: "index_educations_on_contact_id", using: :btree

  create_table "recommended_visitors", force: :cascade do |t|
    t.string   "linkedin_url"
    t.string   "name"
    t.string   "title"
    t.string   "company"
    t.integer  "contact_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "recommended_visitors", ["contact_id"], name: "index_recommended_visitors_on_contact_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "skills", ["contact_id"], name: "index_skills_on_contact_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "linkedin_token"
    t.string   "linkedin_secret"
    t.string   "picture_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "companies", "contacts"
  add_foreign_key "educations", "contacts"
  add_foreign_key "recommended_visitors", "contacts"
  add_foreign_key "skills", "contacts"
end
