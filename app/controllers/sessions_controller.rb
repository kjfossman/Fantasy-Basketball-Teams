class SessionsController < ApplicationController

    get '/login' do 
        redirect_if_logged_in
        erb :'sessions/new'
    end

    post '/login' do 
        redirect_if_logged_in
        user = User.find_by(username: params["user"]["username"])

        if user && user.authenticate(params["user"]["password"])
            session["user_id"] = user.id
            flash[:success] = "Welcome Back!"
            redirect "/user-teams"
        elsif user 
            flash[:failure] = "Incorrect Password"
            redirect "/login"
        else 
            flash[:failure] = "No Account Found"
            redirect "/login"
        end
    end

    get '/logout' do 
        erb :"sessions/delete"
    end
    
    delete '/logout' do 
        redirect_if_not_logged_in
        session.delete("user_id")
        redirect "/login"
    end

end