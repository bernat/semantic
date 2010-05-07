if Rails.env.production?
  APP_CONFIG = {}
  APP_CONFIG['username'] = ENV['username']
  APP_CONFIG['password'] = ENV['password']
else
  APP_CONFIG = YAML.load_file("#{Rails.root}/config/app.yml")
end
