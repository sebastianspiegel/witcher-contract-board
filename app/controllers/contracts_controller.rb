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
        if @contract.save
            redirect_to contract_path(@contract.id)
        else
            render :new
        end
    end

    def show
        @contract = Contract.find(params[:id])
        @user = User.find(session[:user_id])
        if @contract.contract_is_claimed?
            if @contract.claimed_by != @user || @contract.user_id != current_user
                redirect_to contracts_path
            end
        end
    end

    def index 
        @contracts = Contract.unclaimed_contracts 
    end

    def edit
        redirect_if_not_logged_in
        
        @contract = Contract.find(params[:id])
        if @contract.user != current_user
            flash[:message] = "You cannot edit this contract."
            redirect_to contract_path(@contract.id)
        elsif @contract.contract_is_claimed?  
            flash[:message] = "You cannot edit a contract that has been claimed."
            redirect_to contract_path(@contract.id)
        end
    end

    def update
        @contract = Contract.find(params[:id])
        @contract.update(contract_params)
        if @contract.valid?
            if params[:contract][:witcher_id] != nil
                flash[:message] = "You have sucessfully claimed this contract."
                redirect_to user_path(session[:user_id])
            else
                redirect_to contract_path(@contract.id)
            end
        else
            render :edit
        end
    end

    private

    def contract_params
        params.require(:contract).permit(:details, :reward, :monster_id, :location_id, :witcher_id, monster_attributes: [:name, :type_id], location_attributes: [:name])
    end

end
