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

ActiveRecord::Schema.define(:version => 20120818211718) do

  create_table "tenants", :force => true do |t|
    t.string   "name",                     :limit => 50
    t.string   "description",              :limit => 50
    t.string   "email",                    :limit => 50
    t.string   "phone",                    :limit => 50
    t.string   "address",                  :limit => 50
    t.string   "main_contact",             :limit => 50
    t.boolean  "active"
    t.boolean  "not_deleted"
    t.string   "custom_name_for_tenant",   :limit => 30
    t.string   "custom_name_for_unit",     :limit => 30
    t.string   "custom_name_for_template", :limit => 30
    t.string   "customer_id",              :limit => 50
    t.string   "customer_code",            :limit => 50
    t.datetime "license_expiry_date"
    t.integer  "licenses_total"
    t.integer  "licenses_used"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "unit_managers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "unit_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "unit_managers", ["unit_id"], :name => "index_unit_managers_on_unit_id"
  add_index "unit_managers", ["user_id"], :name => "index_unit_managers_on_user_id"

  create_table "units", :force => true do |t|
    t.string   "name",        :limit => 50
    t.string   "description"
    t.boolean  "active"
    t.boolean  "not_deleted"
    t.integer  "parent_id"
    t.integer  "tenant_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "units", ["parent_id"], :name => "index_units_on_parent_id"
  add_index "units", ["tenant_id"], :name => "index_units_on_tenant_id"

  create_table "users", :force => true do |t|
    t.string   "username",            :limit => 102
    t.string   "first_name",          :limit => 50
    t.string   "last_name",           :limit => 50
    t.string   "email",               :limit => 100
    t.boolean  "active"
    t.boolean  "not_deleted"
    t.string   "recorder_user_id",    :limit => 500
    t.string   "recorder_account_id", :limit => 500
    t.integer  "tenant_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "users", ["tenant_id"], :name => "index_users_on_tenant_id"

end
