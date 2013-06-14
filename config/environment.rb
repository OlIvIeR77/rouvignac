# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Rouvignac::Application.initialize!


Rails::Initializer.run do |config|
  config.middleware.use â€œNoWWWâ€ if RAILS_ENV == â€˜productionâ€™
end