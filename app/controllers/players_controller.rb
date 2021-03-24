class PlayersController < ApplicationController
    
    get '/players' do
        @players = Player.all 
        @players = @players.sort_by {|x| x.last_name}
        erb :"players/index"
    end

    get '/players/search' do 
        @players = Player.all.select {|x| x.last_name == params["last_name"]}
        erb :"players/results"
    end

end