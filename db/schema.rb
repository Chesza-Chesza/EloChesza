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

ActiveRecord::Schema.define(version: 2021_04_26_214516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "homes", force: :cascade do |t|
    t.string "index"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer "fide_number"
    t.integer "title"
    t.string "name", null: false
    t.string "last_name"
    t.string "fed", null: false
    t.integer "gender"
    t.date "b_day", null: false
    t.boolean "ranked_player"
    t.integer "elo", default: 0, null: false
    t.integer "ranked_opponents"
    t.integer "k_value"
    t.datetime "last_elo_update"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "referees", force: :cascade do |t|
    t.integer "fide_id"
    t.string "name"
    t.integer "title", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "referees_tournaments", id: false, force: :cascade do |t|
    t.bigint "referee_id", null: false
    t.bigint "tournament_id", null: false
    t.index ["referee_id", "tournament_id"], name: "index_referees_tournaments_on_referee_id_and_tournament_id"
    t.index ["tournament_id", "referee_id"], name: "index_referees_tournaments_on_tournament_id_and_referee_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.date "date"
    t.integer "number"
    t.bigint "tournament_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tournament_id"], name: "index_rounds_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.integer "event_code"
    t.string "name"
    t.string "city"
    t.string "country"
    t.integer "players_quantity"
    t.date "start_date"
    t.date "end_date"
    t.integer "total_rounds", default: 1
    t.integer "system"
    t.integer "time_control"
    t.bigint "referee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["referee_id"], name: "index_tournaments_on_referee_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "rounds", "tournaments"
  add_foreign_key "tournaments", "referees"
end
