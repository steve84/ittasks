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

ActiveRecord::Schema.define(version: 20150321165146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string   "name"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "flat_file_name"
    t.string   "flat_content_type"
    t.integer  "flat_file_size"
    t.datetime "flat_updated_at"
  end

  add_index "attachments", ["attachable_id", "attachable_type"], name: "index_attachments_on_attachable_id_and_attachable_type", using: :btree

  create_table "calculations", force: :cascade do |t|
    t.float    "amount"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories_tasks", id: false, force: :cascade do |t|
    t.integer "task_id"
    t.integer "category_id"
  end

  add_index "categories_tasks", ["category_id"], name: "index_categories_tasks_on_category_id", using: :btree
  add_index "categories_tasks", ["task_id"], name: "index_categories_tasks_on_task_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "street"
    t.string   "plz"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.text     "remark"
    t.integer  "amount"
    t.integer  "task_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "offers", ["task_id"], name: "index_offers_on_task_id", using: :btree
  add_index "offers", ["user_id"], name: "index_offers_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "question"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["task_id"], name: "index_questions_on_task_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.float    "value"
    t.text     "remark"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ratings", ["task_id"], name: "index_ratings_on_task_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "duration"
    t.integer  "principal_id"
    t.integer  "agent_id"
    t.integer  "location_id"
    t.integer  "calculation_id"
    t.integer  "rating_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "tasks", ["agent_id"], name: "index_tasks_on_agent_id", using: :btree
  add_index "tasks", ["calculation_id"], name: "index_tasks_on_calculation_id", using: :btree
  add_index "tasks", ["location_id"], name: "index_tasks_on_location_id", using: :btree
  add_index "tasks", ["principal_id"], name: "index_tasks_on_principal_id", using: :btree
  add_index "tasks", ["rating_id"], name: "index_tasks_on_rating_id", using: :btree

  create_table "tasks_technologies", id: false, force: :cascade do |t|
    t.integer "task_id"
    t.integer "technology_id"
  end

  add_index "tasks_technologies", ["task_id"], name: "index_tasks_technologies_on_task_id", using: :btree
  add_index "tasks_technologies", ["technology_id"], name: "index_tasks_technologies_on_technology_id", using: :btree

  create_table "technologies", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.integer  "location_id"
    t.integer  "role_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["location_id"], name: "index_users_on_location_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "offers", "tasks"
  add_foreign_key "offers", "users"
  add_foreign_key "questions", "tasks"
  add_foreign_key "ratings", "tasks"
  add_foreign_key "tasks", "calculations"
  add_foreign_key "tasks", "locations"
  add_foreign_key "tasks", "ratings"
  add_foreign_key "tasks", "users", column: "agent_id"
  add_foreign_key "tasks", "users", column: "principal_id"
  add_foreign_key "users", "locations"
  add_foreign_key "users", "roles"
end
