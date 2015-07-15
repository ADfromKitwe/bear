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

ActiveRecord::Schema.define(version: 20140701223152) do

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materials", force: true do |t|
    t.integer  "project_id"
    t.string   "item"
    t.text     "description"
    t.decimal  "price",       precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "materials", ["project_id"], name: "index_materials_on_project_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "location"
    t.text     "details"
    t.decimal  "price",       precision: 10, scale: 0
    t.string   "status"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["customer_id"], name: "index_projects_on_customer_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
