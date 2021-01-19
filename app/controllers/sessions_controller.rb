class SessionsController < ApplicationController

    def welcome
    end

    def new
    end

    def create
        if params[:user][:name] == nil || params[:user][:name] == ""
            redirect_to signin_path
        else
            @user = User.find_by(name: params[:user][:name])
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
