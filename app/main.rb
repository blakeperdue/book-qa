require_relative 'require_all'
using Rainbow
@prompt = TTY::Prompt.new


def get_choice
  puts ''
  choices = [
    { name: 'QUIT', value: 'quit' },
    { name: '════════════════════════════════'.blue, value: 'quit' },
    {
      name:"1. Process sheets to give to QA (#{@paths.files_in.process_before_qa})",
      value: 'process_before_qa'
    },
    {
      name:"2. Process sheets after QA done (#{@paths.files_in.process_after_qa})",
      value: 'process_after_qa'
    },
    {
      name:"3. Export report on results (#{@paths.reports}/)",
      value: 'generate_report'
    },
    { name: '════════════════════════════════'.blue, value: 'quit' },
  ]

  value = @prompt.select("Choose what to do: ", choices, cylce: true, per_page: 20)
  puts "\n" + '══' * 24
  # clear logs for easier debugging
  # `rake log:clear`

  if value == 'quit'
    exit
  else
    eval(value)
  end

  puts "\n" + 'Complete!'.green + "\n"
  get_choice() unless value == 'quit'
end

puts '╔══════════════════════╗'.green
puts '║ '.green + '  CoachMe QA Tools  '.black.bg(:green) + ' ║'.green
puts '╚══════════════════════╝'.green
get_choice()
