require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do 
      erb :index
    end 

    get '/new' do 
      erb :'pirates/new' 
    end 

    post '/pirates' do 
      @pirate = Pirate.new(params[:pirate][:name], params[:pirate][:weight], params[:pirate][:height])
      params[:pirate][:ships].each do |data|
        Ship.new(data)
      end 
      @ships = Ship.all 
      erb :'pirates/show'
    end 

  end
end
