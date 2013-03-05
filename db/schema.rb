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

ActiveRecord::Schema.define(:version => 20130305045925) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "des"
    t.text     "text"
    t.integer  "view"
    t.string   "author"
    t.string   "mini_img"
    t.integer  "add_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "title",       :limit => 256
    t.string   "place",       :limit => 256
    t.string   "format",      :limit => 256
    t.date     "date"
    t.date     "date_end"
    t.integer  "price"
    t.text     "description"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "resumes", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "position"
    t.string   "name"
    t.string   "sex"
    t.string   "mar_status"
    t.string   "age"
    t.string   "experience"
    t.string   "city"
    t.string   "min_wage"
    t.string   "schedule"
    t.text     "skills"
    t.text     "education"
    t.text     "about"
    t.string   "phone"
    t.string   "email"
    t.datetime "date"
    t.integer  "view"
    t.string   "avatar"
    t.integer  "group_id",   :default => 1
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "vacancies", :force => true do |t|
    t.string   "position"
    t.text     "note"
    t.string   "experience"
    t.string   "salary"
    t.string   "organisation"
    t.string   "phone"
    t.datetime "date"
    t.string   "email"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
