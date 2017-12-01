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

ActiveRecord::Schema.define(version: 20171129233021) do

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
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sku"
    t.string "stripe_id"
    t.index ["category_id"], name: "index_albums_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start_time", null: false
    t.string "venue_name", null: false
    t.string "venue_address", null: false
    t.string "venue_city", null: false
    t.string "venue_state", null: false
    t.string "venue_phone", default: "", null: false
    t.string "venue_url", default: "", null: false
    t.text "description"
    t.boolean "open_to_public"
    t.boolean "publish"
    t.date "last_day"
    t.date "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "picture"
    t.string "short_description", default: "", null: false
    t.text "long_description", default: "", null: false
    t.integer "price_in_pennies", default: 1500, null: false
    t.boolean "for_sale"
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sku"
    t.string "stripe_id"
  end

  create_table "news_items", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.string "stripe_sku"
    t.integer "quantity"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "stripe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.bigint "album_id"
    t.string "slug", null: false
    t.integer "track_number", null: false
    t.text "lyrics", default: "", null: false
    t.text "credits", default: "", null: false
    t.string "title", null: false
    t.string "audio_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
  end

end
