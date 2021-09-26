# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_27_041018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_tickets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "seat_quantity"
    t.date "creat_at"
    t.boolean "status"
    t.integer "show_id"
    t.string "seats_name"
  end

  create_table "cinenma_seats", force: :cascade do |t|
    t.integer "row"
    t.integer "seat_number"
    t.integer "price"
    t.integer "screen_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "cast"
    t.text "description"
    t.string "time"
    t.date "release"
    t.integer "gerne_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "image_link"
    t.integer "genre_id"
  end

  create_table "screens", force: :cascade do |t|
    t.string "name"
    t.integer "total_seat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seat_reserveds", force: :cascade do |t|
    t.integer "seat_id"
    t.integer "booking_id"
    t.integer "show_id"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seat_types", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seats", force: :cascade do |t|
    t.integer "screen_id"
    t.integer "seat_type_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "rows"
  end

  create_table "shows", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "screen_id"
    t.datetime "date"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "strat_time"
    t.string "end_time"
    t.string "start_time"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.integer "phonenum"
    t.string "city"
    t.string "favorite_cinema"
    t.integer "day"
    t.integer "month"
    t.integer "year"
    t.boolean "sex"
    t.boolean "admin", default: false
  end

end
