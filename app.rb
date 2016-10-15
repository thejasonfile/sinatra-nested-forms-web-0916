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
      Pirate.new(@pirate["name"], @pirate["weight"], @pirate["height"])
      @ships.each do |ship|
        Ship.new(ship["name"], ship["type"], ship["booty"])
      end
      erb :'pirates/show'
    end
  end
end
