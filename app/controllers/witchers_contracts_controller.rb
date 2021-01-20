class WitchersContractsController < ApplicationController

    
    def create
        wc = WitchersContract.new
        @contract = Contract.find(params[:options][:params][:contract_id])
        @user = User.find(params[:options][:params][:user_id])
        wc.contract = @contract 
        wc.user = @user 
        wc.save 
        redirect_to user_path(@user)
    end


end