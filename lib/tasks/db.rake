require 'fileutils'
require 'rainbow'

db_file = 'db/books.db'

desc 'Remove the book database'
task :db_remove do
  puts Rainbow('Removing database...' + "\n").yellow
  FileUtils.rm_f(db_file) if File.exist?(db_file)
  puts Rainbow('Complete! Database removed.' + "\n").yellow
end

desc 'Create database, migrate, seed'
task :db_init do
  raise('Remove database first!!') if File.exist?(db_file)
  puts Rainbow('Creating database, migrating then seeding...' + "\n").yellow
  `bundle exec rake db:create && bundle exec rake db:migrate`
  puts Rainbow('Complete! Database now ready.' + "\n").yellow
end