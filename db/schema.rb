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

ActiveRecord::Schema.define(version: 20180910160924) do

  create_table "competitors", force: :cascade do |t|
    t.string "rep"
    t.string "competitor"
    t.string "comp_type"
    t.string "dart_mkt"
    t.string "zip"
    t.boolean "direct"
    t.date "effective"
    t.string "category"
    t.string "sub_category"
    t.string "description"
    t.string "brand"
    t.string "sub_brand"
    t.string "uom"
    t.decimal "weight"
    t.decimal "price"
    t.decimal "price_lb"
    t.boolean "fresh"
    t.string "sku"
    t.string "dart_desc"
    t.decimal "dart_price"
    t.decimal "avg_price"
    t.string "dart_uom"
    t.decimal "list_price_var"
    t.decimal "avg_price_var"
    t.string "customer"
    t.decimal "lb_in_reg"
    t.decimal "lb_in_sub_reg"
    t.decimal "lb_in_csa"
    t.string "source"
    t.string "delivery"
    t.string "dart_delivery"
    t.boolean "abf"
    t.boolean "waterchilled"
    t.boolean "send_all"
    t.string "grade"
    t.string "specs"
    t.boolean "heritage"
    t.string "breed"
    t.boolean "grass_fed"
    t.boolean "organic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
