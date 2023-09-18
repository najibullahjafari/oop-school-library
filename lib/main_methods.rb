
def handle_option(app, option)
  action = ACTION[option]
  if action
    app.send(action)
  else
    puts 'Invalid option.'
  end
end

def display_menu
  puts "\nPlease choose an option:"
  ACTION.each { |k, v| puts "#{k} - #{v.to_s.tr('_', ' ')}" }
  print 'Option: '
  gets.chomp.to_i
end