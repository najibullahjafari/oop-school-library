
def handle_option(app, option)
  action = ACTION[option]
  if action
    app.send(action)
  else
    puts 'Invalid option.'
  end
end