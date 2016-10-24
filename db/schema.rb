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

ActiveRecord::Schema.define(version: 20161022125257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "city",              null: false
    t.string   "street_name",       null: false
    t.string   "street_number",     null: false
    t.string   "secondary_address"
    t.string   "building_number"
    t.string   "zip_code",          null: false
    t.string   "time_zone"
    t.string   "state"
    t.string   "state_abbr"
    t.string   "country"
    t.string   "country_code"
    t.text     "notes"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "article_categories", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["article_id"], name: "index_article_categories_on_article_id", using: :btree
    t.index ["category_id"], name: "index_article_categories_on_category_id", using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",                            null: false
    t.string   "slug",                             null: false
    t.text     "description",                      null: false
    t.text     "content",                          null: false
    t.boolean  "published",        default: false
    t.date     "publication_date"
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["slug"], name: "index_articles_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_articles_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "topic",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic"], name: "index_categories_on_topic", unique: true, using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content",    null: false
    t.integer  "article_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "message",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identities", force: :cascade do |t|
    t.string   "provider",                  null: false
    t.string   "uid",                       null: false
    t.string   "token"
    t.string   "secret"
    t.boolean  "expires"
    t.date     "expires_at"
    t.jsonb    "raw_info",   default: "{}", null: false
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "index_identities_on_user_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "identity_id"
    t.integer  "article_id"
    t.integer  "service_id"
    t.integer  "portfolio_id"
    t.text     "url",                          null: false
    t.text     "path",                         null: false
    t.boolean  "active",       default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["article_id"], name: "index_images_on_article_id", using: :btree
    t.index ["identity_id"], name: "index_images_on_identity_id", using: :btree
    t.index ["portfolio_id"], name: "index_images_on_portfolio_id", using: :btree
    t.index ["service_id"], name: "index_images_on_service_id", using: :btree
    t.index ["user_id"], name: "index_images_on_user_id", using: :btree
  end

  create_table "languages", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",         limit: 200, null: false
    t.text     "description"
    t.string   "url_language", limit: 200
    t.date     "obtained"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_languages_on_user_id", using: :btree
  end

  create_table "links", force: :cascade do |t|
    t.string   "social_media", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["social_media"], name: "index_links_on_social_media", unique: true, using: :btree
  end

  create_table "phones", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "country_code"
    t.string   "area_code"
    t.string   "extension"
    t.string   "number",       null: false
    t.text     "notes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_phones_on_user_id", using: :btree
  end

  create_table "portfolio_skills", force: :cascade do |t|
    t.integer  "portfolio_id"
    t.integer  "skill_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["portfolio_id"], name: "index_portfolio_skills_on_portfolio_id", using: :btree
    t.index ["skill_id"], name: "index_portfolio_skills_on_skill_id", using: :btree
  end

  create_table "portfolios", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "client",       null: false
    t.string   "description",  null: false
    t.string   "title",        null: false
    t.string   "url_project"
    t.date     "date_project"
    t.boolean  "hidden"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_portfolios_on_user_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",                       null: false
    t.string   "description",                 null: false
    t.boolean  "active",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["user_id"], name: "index_services_on_user_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "superpower", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["superpower"], name: "index_skills_on_superpower", unique: true, using: :btree
  end

  create_table "user_links", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "link_id"
    t.string   "url",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_user_links_on_link_id", using: :btree
    t.index ["user_id"], name: "index_user_links_on_user_id", using: :btree
  end

  create_table "user_skills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.text     "description"
    t.string   "url",         null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["skill_id"], name: "index_user_skills_on_skill_id", using: :btree
    t.index ["user_id"], name: "index_user_skills_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "email",                                  null: false
    t.string   "encrypted_password",                     null: false
    t.string   "username"
    t.boolean  "admin",                  default: false
    t.text     "presentation"
    t.date     "date_of_birth"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "article_categories", "articles"
  add_foreign_key "article_categories", "categories"
  add_foreign_key "articles", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "identities", "users"
  add_foreign_key "images", "articles"
  add_foreign_key "images", "identities"
  add_foreign_key "images", "portfolios"
  add_foreign_key "images", "services"
  add_foreign_key "images", "users"
  add_foreign_key "languages", "users"
  add_foreign_key "phones", "users"
  add_foreign_key "portfolio_skills", "portfolios"
  add_foreign_key "portfolio_skills", "skills"
  add_foreign_key "portfolios", "users"
  add_foreign_key "services", "users"
  add_foreign_key "user_links", "links"
  add_foreign_key "user_links", "users"
  add_foreign_key "user_skills", "skills"
  add_foreign_key "user_skills", "users"
end
