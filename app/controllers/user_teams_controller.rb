class UserTeamsController < ApplicationController

    get '/user-teams' do 
        @users = User.all
        erb :"user_teams/index"
    end

    get '/user-teams-owned' do
        redirect_if_not_logged_in
        @user_teams = current_user.user_teams
        erb :"user_teams/owned"
    end

    get '/user-teams/new' do 
        redirect_if_not_logged_in
        @players = Player.all
        @players = @players.sort_by {|x| x.last_name}
        erb :"user_teams/new"
    end

    get '/users/:id' do 
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        erb :"user_teams/show"
    end

    post '/user-teams' do 
        redirect_if_not_logged_in
        @player_ids = params["user_team"]["player_ids"]
        @user_team = current_user.user_teams.create(name: params["name"])
        @player_ids.each do |x|
            player = Player.find_by_id(x)
            @user_team.players << player
        end
        redirect '/user-teams'
    end

    get '/user_teams/:id/edit' do 
        binding.pry 
    end




    # get '/user-teams/:id' do 
    #     redirect_if_not_logged_in
        
    #     erb :"user_teams/show"
    # end

    # post '/user-teams' do 
    #     redirect_if_not_logged_in

    # end

end