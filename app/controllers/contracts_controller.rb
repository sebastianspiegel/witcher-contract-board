class ContractsController < ApplicationController

    def new 
        @contract = Contract.new 
    end

    def create
        @contract = Contract.new(details: params[:contract][:details], reward: params[:contract][:reward], user_id: session[:user_id])
        if params[:contract][:monster_id] != "1"
            @contract.monster_id = params[:contract][:monster_id]
        else
            @contract.monster = Monster.create(name: params[:contract][:monster][:name], type_id: params[:contract][:monster][:type_id])
        end
        if params[:contract][:location_id] != "1"
            @contract.location_id = params[:contract][:location_id]
        else
            @contract.location = Location.create(name: params[:contract][:location][:name])
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
    end

    def update
    end

    private

    def contract_params
        params.permit(:contract).require(:details, :reward, :monster_id, :monster, :location_id, :location)
    end

end
