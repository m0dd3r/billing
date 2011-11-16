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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111115172036) do

  create_table "accounts", :force => true do |t|
    t.integer  "billing_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.integer  "payments_per_year"
    t.decimal  "price",             :precision => 8, :scale => 2
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promo_codes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "code"
    t.date     "valid_through"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
