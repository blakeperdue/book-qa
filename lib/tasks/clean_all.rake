require 'fileutils'

db_file = 'db/books.db'

desc 'Remove all book data'
task :clean_all do
  FileUtils.rm_f(db_file) if File.exist?(db_file)
end