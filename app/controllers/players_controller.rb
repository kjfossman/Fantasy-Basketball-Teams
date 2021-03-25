class PlayersController < ApplicationController
    
    get '/players' do
        @players = Player.all 
        @players = @players.sort_by {|x| x.last_name}
        erb :"players/index"
    end

    get '/players/search' do 
        @player = Player.find_by_id(params["player_id"])
        @nba_team = NbaTeam.find_by_id(@player.nba_team.id)
        erb :"players/results"
    end

end