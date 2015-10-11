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

ActiveRecord::Schema.define(version: 20151011223954) do

  create_table "dpts", force: true do |t|
    t.integer  "subdistrict_id"
    t.integer  "village_id"
    t.string   "jml_tps"
    t.string   "jml_laki_laki"
    t.string   "jml_perempuan"
    t.string   "jml_laki_laki_perempuan"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subdistricts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "villages", force: true do |t|
    t.integer  "subdistrict_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
