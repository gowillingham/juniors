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

ActiveRecord::Schema.define(:version => 20130302221950) do

  create_table "payments", :force => true do |t|
    t.integer  "registration_id",                                 :null => false
    t.integer  "amount",                       :default => 0
    t.boolean  "online",                       :default => false
    t.boolean  "scholarship",                  :default => false
    t.string   "paypal_txn_id"
    t.string   "paypal_txn_type"
    t.string   "paypal_mc_fee"
    t.string   "paypal_sandbox"
    t.string   "paypal_payment_status"
    t.string   "paypal_pending_status_reason"
    t.string   "paypal_payment_type"
    t.string   "paypal_verify_sign"
    t.string   "paypal_payer_status"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "category"
    t.boolean  "enabled",     :default => true
    t.integer  "price",       :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "code"
  end

  create_table "registrations", :force => true do |t|
    t.string   "first_name",                            :null => false
    t.string   "last_name",                             :null => false
    t.string   "parent_first_name",                     :null => false
    t.string   "parent_last_name",                      :null => false
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "tshirt_size"
    t.string   "parent_tshirt_size"
    t.string   "school"
    t.string   "grade"
    t.string   "note"
    t.boolean  "waiver",             :default => false
    t.boolean  "parent_helper",      :default => false
    t.boolean  "volleyball",         :default => false
    t.integer  "product_id",                            :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

end
