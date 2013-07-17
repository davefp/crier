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

ActiveRecord::Schema.define(version: 20130717180529) do

  create_table "component_status_transitions", force: true do |t|
    t.integer  "component_id"
    t.string   "event"
    t.string   "from"
    t.string   "to"
    t.datetime "created_at"
    t.text     "message"
  end

  add_index "component_status_transitions", ["component_id"], name: "index_component_status_transitions_on_component_id"

  create_table "components", force: true do |t|
    t.string   "name"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
