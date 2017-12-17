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

ActiveRecord::Schema.define(version: 20171215135316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoices", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.date "from"
    t.date "to"
    t.text "content"
    t.bigint "property_id"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_invoices_on_property_id"
    t.index ["tenant_id"], name: "index_invoices_on_tenant_id"
  end

  create_table "landlords", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "city"
    t.string "zip"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "city"
    t.string "zip"
    t.string "rent"
    t.string "charges"
    t.bigint "landlord_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["landlord_id"], name: "index_properties_on_landlord_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "city"
    t.string "zip"
    t.string "email"
    t.string "phone"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_tenants_on_property_id"
  end

  add_foreign_key "invoices", "properties"
  add_foreign_key "invoices", "tenants"
  add_foreign_key "properties", "landlords"
  add_foreign_key "tenants", "properties"
end
