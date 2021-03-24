class UsersController < ApplicationController
    
    get '/signup' do 
        binding.pry
        redirect_if_logged_in
        erb :"users/new"
    end

    post '/signup' do 
        redirect_if_logged_in
        binding.pry
        user = User.create(params["user"])

        if user.save
            session["user_id"] = user.id 
            redirect "/user-teams"
        else
            redirect "/signup"
        end
    end

end