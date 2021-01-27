class UsersController < ApplicationController

    def new
        @user = User.new 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find(params[:id])
        if @user.witcher? 
            @contracts = @user.claimed_contracts
        else 
            @contracts = @user.contracts
        end
    end

    def witchers
        @witchers = User.all_witchers
    end

    def index
        @monster = Monster.find(params[:monster_id])
        @users = @monster.users 
    end

    private 

    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation, :school_id)
    end
    
end
