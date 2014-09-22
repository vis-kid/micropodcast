require './sinatra/auth'
require 'v8'
require 'coffee-script'
require 'dm-core'
require 'dm-migrations'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'rdiscount'
require 'sass'
require 'slim'
require './episode.rb'
require 'sinatra'
require 'puma'
require 'will_paginate'
require 'will_paginate/data_mapper'

configure do
	enable :sessions
  set :server, :puma 
  set :session_secret, '50me 5ecret Matr1ck5 next level 5h1t'
end

configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
end

configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end

get('/javascripts/application.js'){ coffee :application }
get('/application.css'){ sass :application }


get '/' do
  @title = ' :home'
  @episodes = Episode.all(order: [:released_on.desc]).paginate(:page => params[:page], :per_page => 7)
  slim :home, layout: :knowledge_bomb_layout
end


get '/episodes/new' do
  protected!
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
  protected!
  @title = ' :edit'
  @episode = find_episode
  slim :edit_episode 
end

put '/episodes/:id' do
  protected!
  episode = find_episode
  episode.update(params[:episode])
  redirect to("/episodes/#{ episode.id }")
end

delete '/episodes/:id' do
  protected!
  episode = find_episode
  episode.destroy
  redirect to('/')
end

post '/episodes' do
  protected!
  episode = Episode.create(params[:episode])
  redirect to("/episodes/#{ episode.id }")
end

get '/about' do
  @title = ' :about'
  slim :about
end

#get '/topics' do
#  @title = ' :topics'
#  slim :topics
#end

not_found do
	slim :not_found
end

helpers do
  def admin?
		session[:admin]
	end
end

private

def find_episode
  Episode.get(params[:id])
end
