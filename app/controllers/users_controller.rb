class UsersController < ApplicationController
 
    get '/signup' do 
        redirect_if_logged_in
        erb :"users/new"
    end

    post '/signup' do 
        redirect_if_logged_in
        user = User.create(params["user"])
       
        if user.save
            session["user_id"] = user.id 
            flash[:success] = "Congratulations on Creating an Account!"
            redirect "/user-teams"
        elsif params["user"]["password"] != params["user"]["password_confirmation"]
            flash[:failure] = "Password Confirmation Incorrect"
            redirect "/signup"
        elsif params["user"]["password"] == "" && params["user"]["password_confirmation"] == ""
            flash[:failure] = "User Must Have a Password"
            redirect "/signup"
        else
            flash[:failure] = "Username already exists"
            redirect "/signup"
        end
    end

end