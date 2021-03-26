class PlayersController < ApplicationController
    
    get '/players' do
        @players = Player.all 
        @players = @players.sort_by {|x| x.last_name}
        erb :"players/index"
    end

    get '/players/search' do 
        @player = Player.find_by_id(params["player_id"])
        @nba_team = NbaTeam.find_by_id(@player.nba_team.id)
        redirect "/players/#{@player.id}"
        
    end

    get '/players/:id' do 
        @player = Player.find_by_id(params["id"])
        @nba_team = NbaTeam.find_by_id(@player.nba_team.id)
        erb :"players/results"
    end

    get '/players/:id/edit' do 
      
        redirect_if_not_logged_in
        @player = Player.find_by_id(params["id"])
        erb :"players/show"
    end

    patch '/players/:id' do 
        redirect_if_not_logged_in
        @player = Player.find_by_id(params["id"])
        @player.update(stats_link: params["stats_link"])
        redirect to "/players/#{params["id"]}"
    end

end