require 'sinatra/base'

module Sinatra
  module Auth
    module Helpers 

      def authorized?
        session[:admin]
			end

      def protected!
        halt 401, slim(:unauthorized) unless authorized?
			end
		end
    
    def self.registered(app)
      app.helpers Helpers

      app.enable :sessions

      app.set username: 'Bombcaster',
              password: 'Micropodcast'
     
      app.get '/login' do
				slim :login
			end

      app.post '/login' do
				if params[:username] == settings.username && params[:password] == settings.password
          session[:admin] = true
          redirect to('/')
				else
          redirect to('/login')
				end
			end

      app.get '/logout' do
        session[:admin] = nil
        redirect to('/')
			end
		end
	end
  register Auth
end
