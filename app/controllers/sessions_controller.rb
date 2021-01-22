class SessionsController < ApplicationController

    def welcome
    end

    def new
    end

    def omniauth
        user = User.from_omniauth(request.env['omniauth.auth'])
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to '/signin'
        end
    end

    def create
        if params[:user][:username] == nil || params[:user][:username] == "" 
            redirect_to signin_path
        else
            @user = User.find_by(username: params[:user][:username])
            if !@user.authenticate(params[:user][:password])
                redirect_to signin_path
            else
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
            end
        end
    end

    def logout
        redirect_if_not_logged_in
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
    
end
