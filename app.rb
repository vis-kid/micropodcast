
require 'v8'
require 'coffee-script'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'rdiscount'
require 'sass'
require 'slim'

get('/javascripts/application.js'){ coffee :application }
get('/application.css'){ sass :application }

get '/' do
	@title = ' :home'
  slim :home
end


