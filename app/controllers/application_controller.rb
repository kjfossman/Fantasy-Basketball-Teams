class ApplicationController < Sinatra::Base
  configure do 
    register Sinatra::ActiveRecordExtension
    require 'sinatra'
    require 'sinatra/flash'
    enable :sessions
    set :session_secret, "my_application_secret"
    set :views, "app/views"
  end


  helpers do

    def current_user
      @current_user ||= User.find_by_id(session["user_id"])
    end

    def logged_in?
      !!current_user
    end

    def logged_out?
      !current_user
    end

    def redirect_if_not_logged_in
      redirect "/login" if !logged_in?
    end

    def redirect_if_logged_in 
      redirect "/user-teams" if logged_in?
    end




  end
end