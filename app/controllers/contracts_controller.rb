class ContractsController < ApplicationController

    def new 
        @contract = Contract.new 
    end

    def create
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

end
