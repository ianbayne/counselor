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

ActiveRecord::Schema.define(version: 20171024062436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "user_id"
    t.bigint "counsellor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["counsellor_id"], name: "index_appointments_on_counsellor_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "counsellors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_counsellors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_counsellors_on_reset_password_token", unique: true
  end

  create_table "goals", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "counsellor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["counsellor_id"], name: "index_goals_on_counsellor_id"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "moods", force: :cascade do |t|
    t.integer "mood"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_moods_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "counsellor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["counsellor_id"], name: "index_reviews_on_counsellor_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer "answer"
    t.bigint "question_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_user_profiles_on_question_id"
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "counsellors"
  add_foreign_key "appointments", "users"
  add_foreign_key "goals", "counsellors"
  add_foreign_key "goals", "users"
  add_foreign_key "moods", "users"
  add_foreign_key "reviews", "counsellors"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_profiles", "questions"
  add_foreign_key "user_profiles", "users"
end
