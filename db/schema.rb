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

ActiveRecord::Schema.define(version: 20150326141520) do

  create_table "forms", force: :cascade do |t|
    t.integer  "letter_code"
    t.string   "requestor"
    t.string   "secretary"
    t.string   "payment_type"
    t.string   "company_name"
    t.decimal  "total_amount"
    t.string   "supplier"
    t.integer  "actable_id"
    t.string   "actable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "title"
    t.string   "name_of_check"
    t.integer  "cv_number"
  end

  add_index "forms", ["actable_id"], name: "index_forms_on_actable_id"

  create_table "items_tables", force: :cascade do |t|
    t.integer  "itemable_id"
    t.string   "itemable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "with_pos", force: :cascade do |t|
    t.string   "engineer"
    t.integer  "po"
    t.integer  "jo"
    t.integer  "page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "without_pos", force: :cascade do |t|
    t.integer  "transaction_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
