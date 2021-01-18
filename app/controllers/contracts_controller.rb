class ContractsController < ApplicationController

    def new 
    end

    def create
    end

    def show
        @contract = Contract.find(params[:id])
    end

    def index 
        @contracts = all_unclaimed_contracts
    end

    def edit
    end

    def update
    end

end
