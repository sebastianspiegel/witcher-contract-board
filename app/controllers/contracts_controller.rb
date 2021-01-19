class ContractsController < ApplicationController

    include ContractsHelper

    def new 
        redirect_if_not_logged_in
        @contract = Contract.new 
        @contract.build_monster
        @contract.build_location 
    end

    def create
        @contract = Contract.new(contract_params)
        @contract.user = current_user
        if params[:monster_id]
            @monster = Monster.find(params[:monster_id])
        end

        if params[:location_id]
            @location = Location.find(params[:location_id])
        end

        if @contract.save
            redirect_to contract_path(@contract.id)
        else
            render :new
        end
    end

    def show
        @contract = Contract.find(params[:id])
        @user = User.find(session[:user_id])
    end

    def index 
        @contracts = Contract.all #only the unclaimed contracts 
    end

    def edit
        redirect_if_not_logged_in
        @contract = Contract.find(params[:id])
    end

    def update
        @contract = Contract.find(params[:id])
        @contract.update(contract_params)
        redirect_to contract_path(@contract.id)
    end

    private

    def contract_params
        params.require(:contract).permit(:details, :reward, monster_attributes: [:name, :type_id], location_attributes: [:name])
    end

    # def current_user
    #     User.find(session[:user_id])
    # end

end
