$LOAD_PATH << './lib'

# Gems
require 'bundler/setup'
require 'sinatra/base'
require 'rdiscount'
require 'sass'
require 'slim'

# Database
require 'app_db'

class App < Sinatra::Base

  # app_db = AppDB.new

  # Configuration
  set :root, File.dirname(__FILE__)

end

# Routes
require 'app_main'
