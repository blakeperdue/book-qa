using Rainbow
# @DATETIME_FORMAT = '%Y-%m-%d %I:%M:%S'

def process_before_qa
  puts 'Starting processing sheets before QA...'.yellow
  files = find_files
  process_files(files)
end

def find_files
  Dir["#{@paths.files_in.process_before_qa}/*"].sort
end

def process_files(files)
  workbook = RubyXL::Parser.parse(files.first)
  puts workbook.inspect
end

def import_books(file, source, market, customer)
  puts Rainbow('Starting csv import...').yellow
  books = CSV.parse(File.read(file), { headers: true, header_converters: :symbol, converters: :all })
  books.each do |book|
    vals = OpenStruct.new(book.to_hash)
    next unless vals.book_format_value == 'epub' || vals.book_format_value == 'dashpub' || vals.book_format_value == 'dash'
    next unless vals.kind == 'book'

    vals.delete_field('company_type') if vals.to_h.key?(:company_type)
    vals.delete_field('meta_company_type') if vals.to_h.key?(:meta_company_type)

    # if book exists in DB update it instead of creating new
    found = Book.find_by_id(vals.id)
    unless found.nil?
      found.meta_market += " | #{market}" unless found.meta_market.include?(market)
      found.meta_customer += " | #{customer}" unless found.meta_customer.include?(customer)
      # if store book, replace views as the count isn't specific to a brand or customer or market
      if source == @SOURCE.store || source == @SOURCE.all
        found.meta_views = vals.meta_views.to_i if vals.to_h.key?(:meta_views)
        if found.meta_sales.nil? || found.meta_sales == 0 && vals.to_h.key?(:meta_sales)
          found.meta_sales = vals.meta_sales
        end
      elsif !found.meta_market.include?(market) && !found.meta_customer.include?(customer)
        found.meta_views += vals.meta_views.to_i if vals.to_h.key?(:meta_views)
      end
      add_meta_customer_details(source, customer, found, vals)
      found.save
      next
    end

    vals.meta_is_courseware = false
    vals.meta_is_math = false
    vals.meta_in_vst_catalog = true
    vals.meta_market = market
    vals.meta_customer = customer if vals.meta_customer.nil?

    print "\rSaving book: " + Rainbow(vals.meta_market).green + "\t" + Rainbow(vals.meta_customer).blue + "\t" + Rainbow(vals.vbid).purple + "     "
    newBook = Book.new(vals.to_h)
    add_meta_customer_details(source, customer, newBook, vals)
    newBook.save!
  end

  puts Rainbow("\nCompleted csv import!\n").yellow
end


def add_meta_customer_details(source, customer, book, vals)
  return if @SOURCE.all == source
  return if customer == 'Verba'
  return if !book.meta_customer_details.nil? && book.meta_customer_details.include?(customer)
  details = book.meta_customer_details.nil? ? '' : book.meta_customer_details + " | "
  nums = "#{customer} (Codes=#{vals.meta_codes} Views=#{vals.meta_views})"
  book.meta_customer_details = details + nums
end

