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

ActiveRecord::Schema[7.0].define(version: 2023_03_31_042158) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_forms", force: :cascade do |t|
    t.string "house_name"
    t.string "street_name"
    t.string "road"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_form_id"
    t.index ["employee_form_id"], name: "index_address_forms_on_employee_form_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
  end

  create_table "api_v1s", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "publication", default: "Mr.K Publication"
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "book_id", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "business_customer_routes", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.integer "price"
    t.integer "average"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.bigint "event_id"
    t.bigint "user_id"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_forms", force: :cascade do |t|
    t.string "employee_name"
    t.string "email"
    t.string "password"
    t.string "gender"
    t.string "address"
    t.string "mobile_number"
    t.date "birth_date"
    t.string "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "hobbies", default: [], array: true
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "age"
    t.integer "no_of_order"
    t.string "full_time_available"
    t.integer "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lock_version", default: 0, null: false
  end

  create_table "enrols", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id"
    t.bigint "user_id"
    t.index ["event_id"], name: "index_enrols_on_event_id"
    t.index ["user_id"], name: "index_enrols_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "event_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.bigint "phone_number"
    t.string "email"
    t.string "designation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "alt_name"
    t.string "imageable_type", null: false
    t.bigint "imageable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable"
  end

  create_table "order_layouts", force: :cascade do |t|
    t.integer "quantity"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_layout_id"
    t.index ["product_layout_id"], name: "index_order_layouts_on_product_layout_id"
  end

  create_table "order_routes", force: :cascade do |t|
    t.integer "quantity"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_route_id"
    t.index ["product_route_id"], name: "index_order_routes_on_product_route_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "quantity"
    t.integer "total_price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.bigint "query_product_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["query_product_id"], name: "index_orders_on_query_product_id"
  end

  create_table "post_comments", force: :cascade do |t|
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_id"
    t.index ["post_id"], name: "index_post_comments_on_post_id"
  end

  create_table "post_likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_user_id"
    t.bigint "post_id"
    t.index ["post_id"], name: "index_post_likes_on_post_id"
    t.index ["post_user_id"], name: "index_post_likes_on_post_user_id"
  end

  create_table "post_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_user_id"
    t.index ["post_user_id"], name: "index_posts_on_post_user_id"
  end

  create_table "product_layouts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_routes", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price"
    t.integer "quantity"
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "query_products", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "price"
    t.integer "capacity"
    t.boolean "is_active"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.string "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "terms_con"
  end

  create_table "user_conts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_layouts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_user_layouts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_user_layouts_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "address_forms", "employee_forms"
  add_foreign_key "books", "authors"
  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users"
  add_foreign_key "enrols", "events"
  add_foreign_key "enrols", "users"
  add_foreign_key "events", "categories"
  add_foreign_key "events", "users"
  add_foreign_key "order_layouts", "product_layouts"
  add_foreign_key "order_routes", "product_routes"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "query_products"
  add_foreign_key "post_comments", "posts"
  add_foreign_key "post_likes", "post_users"
  add_foreign_key "post_likes", "posts"
  add_foreign_key "posts", "post_users"
end
