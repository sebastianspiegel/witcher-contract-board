class MonstersController < ApplicationController

    def show
        @monster = Monster.find(params[:id])
    end

    def index
        @monsters = Monster.all 
    end
end
