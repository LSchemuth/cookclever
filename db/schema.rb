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

ActiveRecord::Schema.define(version: 2020_08_18_140203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "amounts", force: :cascade do |t|
    t.float "quantity"
    t.string "unit"
    t.bigint "recipe_id", null: false
    t.bigint "ingredient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_amounts_on_ingredient_id"
    t.index ["recipe_id"], name: "index_amounts_on_recipe_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.datetime "pickup_time"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_baskets_on_user_id"
  end

  create_table "confirmation_pages", force: :cascade do |t|
    t.bigint "basket_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["basket_id"], name: "index_confirmation_pages_on_basket_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.datetime "expiration_date"
    t.bigint "supermarket_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supermarket_id"], name: "index_ingredients_on_supermarket_id"
  end

  create_table "ordered_amounts", force: :cascade do |t|
    t.bigint "ingredient_id", null: false
    t.bigint "order_id", null: false
    t.float "quantity", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_ordered_amounts_on_ingredient_id"
    t.index ["order_id"], name: "index_ordered_amounts_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "basket_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["basket_id"], name: "index_orders_on_basket_id"
    t.index ["recipe_id"], name: "index_orders_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "supermarket_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supermarket_id"], name: "index_recipes_on_supermarket_id"
  end

  create_table "supermarkets", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_supermarkets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "amounts", "ingredients"
  add_foreign_key "amounts", "recipes"
  add_foreign_key "baskets", "users"
  add_foreign_key "confirmation_pages", "baskets"
  add_foreign_key "ingredients", "supermarkets"
  add_foreign_key "ordered_amounts", "ingredients"
  add_foreign_key "ordered_amounts", "orders"
  add_foreign_key "orders", "baskets"
  add_foreign_key "orders", "recipes"
  add_foreign_key "recipes", "supermarkets"
  add_foreign_key "supermarkets", "users"
end
