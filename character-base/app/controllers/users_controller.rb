require './config/environment'

class UsersController < ApplicationController

    configure do 
    set :views, 'app/views'
    end

    get '/create_user' do
        redirect_if_already_logged_in
        erb :'users/new'
    end

    post '/create_user' do
        redirect_if_already_logged_in
        user = User.new(params[:user])
            if user.save 
                session["user_id"] = user.id 
                redirect '/characters'
            else
                #Flash Message: Please try again
                redirect '/create_user'
            end
    end

end