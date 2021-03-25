class UserTeamsController < ApplicationController

    get '/user-teams' do 
        redirect_if_not_logged_in
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
        redirect_if_not_authorized_by_user
        @user = User.find_by_id(params[:id])
        erb :"user_teams/show"
    end

    post '/user-teams' do 
        redirect_if_not_logged_in
        @player_ids = params["user_team"]["player_ids"]
        if @player_ids.include?("")
            redirect "/user-teams/new"
        end
        @user_team = current_user.user_teams.create(name: params["name"])
        @player_ids.each do |x|
            UserTeamPlayer.create(player_id: x, user_team_id: @user_team.id)
            # player = Player.find_by_id(x)
            # @user_team.players << player
        end
        redirect '/user-teams'
    end

    get '/user-teams/:id/edit' do 
        redirect_if_not_logged_in
        redirect_if_not_authorized_by_user_team
        @user_team = UserTeam.find_by_id(params[:id])
        @players = Player.all 
        @players = @players.sort_by {|x| x.last_name}
        erb :"user_teams/edit"
    end

    patch '/user-teams/:id' do 
        redirect_if_not_logged_in
        redirect_if_not_authorized_by_user_team
        @user_team = UserTeam.find_by_id(params[:id])
        @user_team.update(name: params["name"])
        @user_team.players.delete_all
        @player_ids = params["user_team"]["player_ids"]
        @player_ids.each do |x|
            UserTeamPlayer.create(player_id: x, user_team_id: @user_team.id)
            # player = Player.find_by_id(x)
            # @user_team.players << player
        end
        @user_team.save
        redirect "/user-teams"
        # redirect "/user_teams/#{@user_team.id}"
    end

    delete '/user-teams/:id' do 
        redirect_if_not_logged_in
        redirect_if_not_authorized_by_user_team
        @user_team = UserTeam.find_by_id(params["id"])
        @user_team.delete
        @sub = session["user_id"]
        redirect "/users/#{session["user_id"]}"
    end

    private
    def redirect_if_not_authorized_by_user
        @user = User.find_by_id(params["id"])
        if @user.id != session["user_id"]
            redirect "/user-teams"
        end
    end

    def redirect_if_not_authorized_by_user_team
        @user_team = UserTeam.find_by_id(params["id"])
        if @user_team.user_id != session["user_id"]
            redirect "/user-teams"
        end
    end



    # get '/user-teams/:id' do 
    #     redirect_if_not_logged_in
        
    #     erb :"user_teams/show"
    # end

    # post '/user-teams' do 
    #     redirect_if_not_logged_in

    # end

end