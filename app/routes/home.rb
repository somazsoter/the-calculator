class HomeRoutes < Sinatra::Base
  set :root,  File.dirname(__FILE__)

  get('/') do
    'The app is running!'
  end
end
