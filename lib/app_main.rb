class App

  get '/' do
		@title = ' :home'
    slim :home
  end

  get '/application.css' do
    sass :application
  end

end
