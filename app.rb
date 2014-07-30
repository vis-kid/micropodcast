$LOAD_PATH << './lib'

require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'rdiscount'
require 'sass'
require 'slim'

get '/' do
	@title = ' :home'
  slim :home
end

get '/application.css' do
  sass :application
end

