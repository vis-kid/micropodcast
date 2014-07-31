$LOAD_PATH << './lib'

require 'v8'
require 'coffee-script'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'rdiscount'
require 'sass'
require 'slim'


get('/application.css'){ sass :application }

get('/javascripts/application.js'){ coffee :application }

get '/' do
	@title = ' :home'
  slim :home
end


