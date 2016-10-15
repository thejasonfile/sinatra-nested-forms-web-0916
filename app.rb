require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      @pirates = Pirate.all

      erb :'pirates/index'
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @pirate = params["pirate"]
      @ships = params["pirate"]["ships"]
      erb :'pirates/show'
    end
  end
end
