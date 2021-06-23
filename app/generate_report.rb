@datetime_format = '%Y-%m-%d %I:%M:%S'

def generate_report
  puts 'generate_report called'
end

def run_export
  puts Rainbow("Starting csv export...\n\n").yellow
  file = "#{@paths.exports}/master_#{Time.now.strftime('%Y.%m.%d_%H%M')}.csv"
  `sqlite3 -header -csv #{@paths.db} "SELECT * FROM books WHERE meta_exclude IS NOT TRUE AND meta_score IS NOT NULL ORDER BY meta_score DESC;" > #{file}`
  puts Rainbow('Completed export: ').yellow + Rainbow(file).green
end

