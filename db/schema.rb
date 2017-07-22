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

ActiveRecord::Schema.define(version: 20170721225611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "slug", null: false
    t.string "title", null: false
    t.string "short_description", default: "", null: false
    t.string "long_description", default: "", null: false
    t.integer "year", default: 1900, null: false
    t.boolean "for_sale", default: false, null: false
    t.boolean "published", default: true, null: false
    t.string "cover_art"
    t.bigint "categories_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories_id"], name: "index_albums_on_categories_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.bigint "albums_id"
    t.string "slug", null: false
    t.integer "track_number", null: false
    t.text "lyrics", default: "", null: false
    t.text "credits", default: "", null: false
    t.string "audio_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["albums_id"], name: "index_songs_on_albums_id"
  end

end
