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

ActiveRecord::Schema.define(:version => 20120625154058) do

  create_table "articles", :force => true do |t|
    t.integer  "column_id"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.string   "title_page"
    t.string   "title_article"
    t.datetime "date_creation"
    t.datetime "date_update"
    t.string   "licence_author",     :default => "Developpez LLC"
    t.integer  "licence_type"
    t.integer  "licence_year_start"
    t.integer  "licence_year_end"
    t.string   "subdomaine"
    t.string   "server_path"
    t.text     "synopsis"
    t.boolean  "no_html_zip"
    t.boolean  "no_html_summary"
    t.boolean  "no_ebook"
    t.boolean  "no_pdf"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  create_table "columns", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "id_dvp"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sections", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "article_id"
    t.integer  "parent_id"
    t.integer  "order"
    t.integer  "depth"
  end

end
