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

ActiveRecord::Schema.define(version: 20180408171533) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "icons", force: :cascade do |t|
    t.string "short", null: false
    t.string "desc", null: false
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_icons_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "fullname", null: false
    t.string "photo"
    t.string "eligible_for_offense_and_defense"
    t.string "position"
    t.string "icons"
    t.integer "age"
    t.string "elias_id"
    t.string "pro_status"
    t.string "jersey"
    t.string "pro_team"
    t.string "bye_week"
    t.string "bats"
    t.string "throws"
    t.bigint "sport_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_players_on_sport_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "sport", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
