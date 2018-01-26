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

ActiveRecord::Schema.define(version: 20180126061814) do

  create_table "articles", force: :cascade do |t|
    t.string   "subject"
    t.string   "description"
    t.integer  "author_id"
    t.string   "descriptive_type"
    t.integer  "descriptive_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["author_id"], name: "index_articles_on_author_id"
    t.index ["descriptive_type", "descriptive_id"], name: "index_articles_on_descriptive_type_and_descriptive_id"
  end

  create_table "articles_tags", id: false, force: :cascade do |t|
    t.integer "article_id", null: false
    t.integer "tag_id",     null: false
    t.index ["article_id", "tag_id"], name: "index_articles_tags_on_article_id_and_tag_id"
    t.index ["tag_id", "article_id"], name: "index_articles_tags_on_tag_id_and_article_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string   "surname"
    t.string   "firstname"
    t.date     "birthdate"
    t.integer  "sex"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "article_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["article_id"], name: "index_chapters_on_article_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "description"
    t.string   "created_by"
    t.integer  "article_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "law_articles", force: :cascade do |t|
    t.string   "law"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scientific_articles", force: :cascade do |t|
    t.string   "science"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "label"
    t.string   "description"
    t.integer  "chapter_id"
    t.integer  "section_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["chapter_id"], name: "index_sections_on_chapter_id"
    t.index ["section_id"], name: "index_sections_on_section_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "label"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "texts", force: :cascade do |t|
    t.string   "description"
    t.text     "text"
    t.integer  "section_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["section_id"], name: "index_texts_on_section_id"
  end

end
