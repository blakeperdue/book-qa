require 'active_record'

Dir.mkdir(@paths.log) unless File.exists?(@paths.log)
ActiveRecord::Base.logger = Logger.new("#{@paths.log}/errors.log")
ActiveRecord::Base.logger.level = :error

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/books.db'
)
