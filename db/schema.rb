# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_09_020440) do

  create_table "battles", force: :cascade do |t|
    t.string "location"
    t.datetime "date"
    t.integer "hero_id"
    t.integer "villain_id"
    t.boolean "hero_win"
    t.boolean "destruction"
    t.float "destruction_severity"
    t.boolean "hero_created"
    t.boolean "villain_created"
  end

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.string "alter_ego"
    t.string "super_power"
    t.integer "power_lvl"
    t.integer "resistance"
    t.integer "hp"
    t.string "gender"
    t.string "race"
    t.text "origin_story"
    t.string "nemesis"
  end

  create_table "villains", force: :cascade do |t|
    t.string "name"
    t.string "alter_ego"
    t.string "super_power"
    t.integer "power_lvl"
    t.integer "resistance"
    t.integer "hp"
    t.string "gender"
    t.string "race"
    t.text "origin_story"
    t.string "nemesis"
    t.text "grievance"
    t.boolean "insane_asylum"
    t.integer "mental_health"
  end

end
