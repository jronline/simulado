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

ActiveRecord::Schema.define(version: 20170906230400) do

  create_table "alternatives", force: :cascade do |t|
    t.text     "title"
    t.boolean  "veracity"
    t.integer  "question_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "alternatives", ["question_id"], name: "index_alternatives_on_question_id"

  create_table "answers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "alternative_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "answers", ["alternative_id"], name: "index_answers_on_alternative_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "areas", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["type"], name: "index_ckeditor_assets_on_type"

  create_table "exams", force: :cascade do |t|
    t.string   "title"
    t.integer  "mock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "exams", ["mock_id"], name: "index_exams_on_mock_id"

  create_table "helper_objects", force: :cascade do |t|
    t.text     "title"
    t.text     "text"
    t.text     "font"
    t.integer  "question_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "helper_objects", ["question_id"], name: "index_helper_objects_on_question_id"

  create_table "institutions", force: :cascade do |t|
    t.string   "title"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mocks", force: :cascade do |t|
    t.string   "title"
    t.integer  "year"
    t.string   "edition"
    t.date     "application_date"
    t.string   "notice"
    t.integer  "institution_id"
    t.integer  "organizer_id"
    t.integer  "category_id"
    t.integer  "area_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "mocks", ["area_id"], name: "index_mocks_on_area_id"
  add_index "mocks", ["category_id"], name: "index_mocks_on_category_id"
  add_index "mocks", ["institution_id"], name: "index_mocks_on_institution_id"
  add_index "mocks", ["organizer_id"], name: "index_mocks_on_organizer_id"

  create_table "organizers", force: :cascade do |t|
    t.string   "title"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_types", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "number"
    t.boolean  "veracity"
    t.integer  "exam_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "question_type_id"
    t.text     "title"
  end

  add_index "questions", ["exam_id"], name: "index_questions_on_exam_id"
  add_index "questions", ["question_type_id"], name: "index_questions_on_question_type_id"

  create_table "user_exam_questions", force: :cascade do |t|
    t.integer  "order"
    t.float    "rating"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_exam_id"
    t.integer  "question_id"
  end

  create_table "user_exams", force: :cascade do |t|
    t.text     "title"
    t.integer  "user_id"
    t.integer  "area_id"
    t.date     "date_application"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "user_exams", ["area_id"], name: "index_user_exams_on_area_id"
  add_index "user_exams", ["user_id"], name: "index_user_exams_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
