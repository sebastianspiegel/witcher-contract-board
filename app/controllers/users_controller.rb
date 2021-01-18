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
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :school_id)
    end

    def witcher?
        #is user a witcher?
        User.find(session[:user.id]).school_id != 1
    end
    
end
