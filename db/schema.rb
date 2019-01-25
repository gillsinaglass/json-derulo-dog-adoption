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

ActiveRecord::Schema.define(version: 2019_01_25_002059) do

  create_table "adoptions", force: :cascade do |t|
    t.integer "buyer_id"
    t.integer "dog_id"
    t.datetime "time"
  end

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.string "weight"
    t.string "height"
    t.string "temperament"
    t.string "breed_group"
    t.string "life_expectancy"
    t.float "min_price"
    t.float "max_price"
  end

  create_table "buyers", force: :cascade do |t|
    t.string "name"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.integer "breed_id"
    t.boolean "disabled"
    t.string "sex"
    t.string "age"
    t.string "size"
  end

end
