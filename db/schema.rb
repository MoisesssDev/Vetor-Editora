# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_22_181351) do
  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.integer "value"
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "evaluateds", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "email"
    t.date "birthdate"
    t.integer "psychologist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["psychologist_id"], name: "index_evaluateds_on_psychologist_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instruments_applieds", force: :cascade do |t|
    t.integer "result"
    t.string "status"
    t.integer "instrument_id", null: false
    t.integer "evaluated_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluated_id"], name: "index_instruments_applieds_on_evaluated_id"
    t.index ["instrument_id"], name: "index_instruments_applieds_on_instrument_id"
  end

  create_table "psychologists", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_psychologists_on_email", unique: true
    t.index ["reset_password_token"], name: "index_psychologists_on_reset_password_token", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.integer "instrument_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instrument_id"], name: "index_questions_on_instrument_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "evaluateds", "psychologists"
  add_foreign_key "instruments_applieds", "evaluateds"
  add_foreign_key "instruments_applieds", "instruments"
  add_foreign_key "questions", "instruments"
end
