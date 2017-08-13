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

ActiveRecord::Schema.define(version: 20170813213039) do

  create_table "bill_actions", force: :cascade do |t|
    t.date "action_date", null: false
    t.date "scheduled_date"
    t.integer "becomes_bill"
    t.integer "bill_id", null: false
    t.string "action", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bill_cosponsors", force: :cascade do |t|
    t.integer "bill_id", null: false
    t.integer "legislator_id", null: false
  end

  create_table "bill_sponsors", force: :cascade do |t|
    t.integer "bill_id", null: false
    t.integer "legislator_id", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.integer "reintroduces"
    t.integer "session", null: false
    t.string "body", null: false
    t.string "number", null: false
    t.string "state", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "citizen_sponsored"
  end

  create_table "committee_memberships", force: :cascade do |t|
    t.date "end_date"
    t.date "start_date", null: false
    t.integer "committee_id", null: false
    t.integer "legislator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "committees", force: :cascade do |t|
    t.string "body", null: false
    t.string "name", null: false
    t.string "state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legislators", force: :cascade do |t|
    t.string "body", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "party"
    t.string "district"
  end

end
