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
  slim :home, layout: :knowledge_bomb_layout
end

get '/episodes/new' do
  @title = ' :new episode'
  @episode = Episode.new
  slim :new_episode 
end

get '/episodes/:id' do
  @title = ' :shownotes'
  @episode = find_episode
  slim :show_episode
end

get '/episodes/:id/edit' do
  @title = ' :edit'
  @episode = find_episode
  slim :edit_episode 
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
  @title = ' :about'
  slim :about
end

get '/topics' do
  @title = ' :topics'
  slim :topics
end

def find_episode
  Episode.get(params[:id])
end
