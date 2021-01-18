class ContractsController < ApplicationController

    def new 
    end

    def create
    end

    def show
        @contract = Contract.find(params[:id])
    end

    def index 
        @contracts = Contract.all 
    end

    def edit
    end

    def update
    end

end
