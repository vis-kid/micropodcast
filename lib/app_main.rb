class App

  get '/' do
		@title = ':home'
    slim :home
  end

  get '/style.css' do
    sass :styles
  end

end
