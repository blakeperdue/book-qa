class CreateTables < ActiveRecord::Migration[6.0]
  def up
    # Courses
    create_table :books do |t|
      # meta values
      t.float   :meta_score
      t.string  :meta_market
      t.string  :meta_customer
      t.string  :meta_customer_details
      t.integer :meta_views
      t.integer :meta_codes
      t.integer :meta_sales
      t.boolean :meta_is_courseware
      t.boolean :meta_is_math
      t.boolean :meta_in_vst_catalog
      t.string  :meta_bisac
      t.boolean :meta_exclude
      # book values
      t.string  :title
      t.string  :author_name
      t.string  :vbid_canonical
      t.string  :vbid
      t.string  :fpid
      t.string  :isbn_10
      t.string  :isbn_13
      t.string  :e_isbn
      t.string  :print_isbn
      t.string  :canonical_print_isbn
      t.integer :imprint_id
      t.string  :imprint_name
      t.integer :publisher_id
      t.string  :eisbn_canonical
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :parent_id
      t.string  :kind
      t.string  :book_format_value
      t.string  :book_format_name
      t.integer :asset_page_count
      t.decimal :publisher_list_price
      t.decimal :store_price
      t.decimal :digital_list_price
      t.string  :isbn
      t.integer :edition
      t.boolean :vcs_authored
      t.string  :publication_date
      t.string  :copyright_date
      t.boolean :block_search
      t.boolean :available
      t.boolean :unavailable
      t.string  :build_status
      t.string  :previous_isbn
      t.string  :next_isbn
      t.string  :off_sale_date
      t.boolean :sampling_allowed
      # company values
      t.integer :company_id
      t.string  :company_name
      t.string  :company_category
    end

    create_table :coursewares do |t|
      # meta values
      t.string  :meta_publisher
      t.string  :meta_found_asset_ids
      t.integer :meta_views
      t.integer :meta_codes
      t.integer :meta_sales
      t.boolean :meta_is_courseware
      t.boolean :meta_is_math
      t.boolean :meta_in_vst_catalog
      # book values
      t.string  :title
      t.string  :author_name
      t.string  :vbid_canonical
      t.string  :vbid
      t.string  :fpid
      t.string  :isbn_10
      t.string  :isbn_13
      t.string  :e_isbn
      t.string  :print_isbn
      t.string  :canonical_print_isbn
      t.integer :imprint_id
      t.string  :imprint_name
      t.integer :publisher_id
      t.string  :eisbn_canonical
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :parent_id
      t.string  :kind
      t.string  :book_format_value
      t.string  :book_format_name
      t.integer :asset_page_count
      t.decimal :publisher_list_price
      t.decimal :store_price
      t.decimal :digital_list_price
      t.string  :isbn
      t.integer :edition
      t.boolean :vcs_authored
      t.string  :publication_date
      t.string  :copyright_date
      t.boolean :block_search
      t.boolean :available
      t.boolean :unavailable
      t.string  :build_status
      t.string  :previous_isbn
      t.string  :next_isbn
      t.string  :off_sale_date
      t.boolean :sampling_allowed
      # company values
      t.integer :company_id
      t.string  :company_name
      t.string  :company_category
    end
  end


  def down
    if ActiveRecord::Base.connection.table_exists?(:books)
      drop_table :books
      drop_table :coursewares
    end
  end
end
