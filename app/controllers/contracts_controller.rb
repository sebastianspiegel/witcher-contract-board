class ContractsController < ApplicationController

    def new 
        @contract = Contract.new 
    end

    def create
        byebug
    end

    def show
        @contract = Contract.find(params[:id])
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
