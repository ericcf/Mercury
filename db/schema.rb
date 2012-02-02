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

ActiveRecord::Schema.define(:version => 20120201184726) do

  create_table "subscribers", :force => true do |t|
    t.string   "email",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "subscribers", ["email"], :name => "index_subscribers_on_email", :unique => true

  create_table "subscriptions", :force => true do |t|
    t.integer  "ticket_id",     :null => false
    t.integer  "subscriber_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "subscriptions", ["ticket_id", "subscriber_id"], :name => "index_subscriptions_on_ticket_id_and_subscriber_id", :unique => true

  create_table "tickets", :force => true do |t|
    t.text     "comment",    :null => false
    t.string   "ip_address"
    t.string   "user_agent"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
