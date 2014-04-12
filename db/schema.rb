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

ActiveRecord::Schema.define(version: 20140412175152) do

  create_table "group_headers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "resolution"
    t.string   "source_url"
    t.string   "source_name"
    t.string   "source_author"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_header_id"
  end

  create_table "nodes", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.date     "date"
    t.float    "value"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "important"
    t.integer  "count"
  end

  create_table "summaries", force: true do |t|
    t.date     "date"
    t.text     "summary"
    t.string   "source_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
