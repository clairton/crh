# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Crh::Application.initialize!

I18n.load_path = Dir.glob("config/locales/*")
