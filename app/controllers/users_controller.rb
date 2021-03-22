class UsersController < ApplicationController
    
    get '/signup' do 
        erb :"users/new"
    end

    post '/signup' do 
        binding.pry
        user = User.create(params["user"])

        if user.save
            session["user_id"] = user.id 
            redirect #####
        else
            redirect "/signup"
        end
    end

end