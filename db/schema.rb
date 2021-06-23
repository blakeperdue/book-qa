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

ActiveRecord::Schema.define(version: 2021_05_01_043958) do

  create_table "books", force: :cascade do |t|
    t.float "meta_score"
    t.string "meta_market"
    t.string "meta_customer"
    t.string "meta_customer_details"
    t.integer "meta_views"
    t.integer "meta_codes"
    t.integer "meta_sales"
    t.boolean "meta_is_courseware"
    t.boolean "meta_is_math"
    t.boolean "meta_in_vst_catalog"
    t.string "meta_bisac"
    t.boolean "meta_exclude"
    t.string "title"
    t.string "author_name"
    t.string "vbid_canonical"
    t.string "vbid"
    t.string "fpid"
    t.string "isbn_10"
    t.string "isbn_13"
    t.string "e_isbn"
    t.string "print_isbn"
    t.string "canonical_print_isbn"
    t.integer "imprint_id"
    t.string "imprint_name"
    t.integer "publisher_id"
    t.string "eisbn_canonical"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "parent_id"
    t.string "kind"
    t.string "book_format_value"
    t.string "book_format_name"
    t.integer "asset_page_count"
    t.decimal "publisher_list_price"
    t.decimal "store_price"
    t.decimal "digital_list_price"
    t.string "isbn"
    t.integer "edition"
    t.boolean "vcs_authored"
    t.string "publication_date"
    t.string "copyright_date"
    t.boolean "block_search"
    t.boolean "available"
    t.boolean "unavailable"
    t.string "build_status"
    t.string "previous_isbn"
    t.string "next_isbn"
    t.string "off_sale_date"
    t.boolean "sampling_allowed"
    t.integer "company_id"
    t.string "company_name"
    t.string "company_category"
  end

  create_table "coursewares", force: :cascade do |t|
    t.string "meta_publisher"
    t.string "meta_found_asset_ids"
    t.integer "meta_views"
    t.integer "meta_codes"
    t.integer "meta_sales"
    t.boolean "meta_is_courseware"
    t.boolean "meta_is_math"
    t.boolean "meta_in_vst_catalog"
    t.string "title"
    t.string "author_name"
    t.string "vbid_canonical"
    t.string "vbid"
    t.string "fpid"
    t.string "isbn_10"
    t.string "isbn_13"
    t.string "e_isbn"
    t.string "print_isbn"
    t.string "canonical_print_isbn"
    t.integer "imprint_id"
    t.string "imprint_name"
    t.integer "publisher_id"
    t.string "eisbn_canonical"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "parent_id"
    t.string "kind"
    t.string "book_format_value"
    t.string "book_format_name"
    t.integer "asset_page_count"
    t.decimal "publisher_list_price"
    t.decimal "store_price"
    t.decimal "digital_list_price"
    t.string "isbn"
    t.integer "edition"
    t.boolean "vcs_authored"
    t.string "publication_date"
    t.string "copyright_date"
    t.boolean "block_search"
    t.boolean "available"
    t.boolean "unavailable"
    t.string "build_status"
    t.string "previous_isbn"
    t.string "next_isbn"
    t.string "off_sale_date"
    t.boolean "sampling_allowed"
    t.integer "company_id"
    t.string "company_name"
    t.string "company_category"
  end

end