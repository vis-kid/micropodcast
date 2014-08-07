
require 'v8'
require 'coffee-script'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'rdiscount'
require 'sass'
require 'slim'
require './episode.rb'
require 'sinatra'
require 'puma'

configure { set :server, :puma }

get('/javascripts/application.js'){ coffee :application }
get('/application.css'){ sass :application }

get '/' do
	@title = ' :home'
	@episodes = Episode.all
  slim :home
end

get '/episodes/new' do
  @episode = Episode.new
	slim :new_episode, layout: :simple_layout
end

get '/episodes/:id' do
	@episode = find_episode
	slim :show_episode, layout: :simple_layout
end

get '/episodes/:id/edit' do
	@episode = find_episode
  slim :edit_episode, layout: :simple_layout
end

put '/episodes/:id' do
	episode = find_episode
  episode.update(params[:episode])
	redirect to("/episodes/#{ episode.id }")
end

delete '/episodes/:id' do
	episode = find_episode
	episode.destroy
	redirect to('/')
end

post '/episodes' do
  episode = Episode.create(params[:episode])
	redirect to("/episodes/#{ episode.id }")
end


get '/about' do
	slim :about
end

get '/topics' do
	slim :topics
end

def find_episode
	Episode.get(params[:id])
end
