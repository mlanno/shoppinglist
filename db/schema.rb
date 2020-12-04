# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_04_032734) do

  create_table "food_categories", force: :cascade do |t|
    t.string "category"
    t.string "aisle"
    t.integer "list_items_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "list_collaborations", force: :cascade do |t|
    t.integer "list_id"
    t.integer "collab_with_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "list_items", force: :cascade do |t|
    t.string "item_name"
    t.integer "quantity"
    t.integer "list_id"
    t.integer "category_id"
    t.text "notes"
    t.boolean "complete_flag", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "unit"
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.string "list_name"
    t.integer "user_id"
    t.integer "list_items_count", default: 0
    t.integer "list_collaborations_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.string "username"
    t.integer "shopping_lists_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
