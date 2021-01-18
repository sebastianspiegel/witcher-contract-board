class UsersController < ApplicationController

    def new
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
        @user = User.find(params[:id])
        if @user.witcher? 
            @contracts = @user.witcher_contracts
        else 
            @contracts = @user.contracts
        end
    end

    private 

    def user_params
        params.require(:user).permit(:name, :password, :school_id)
    end
    
end
