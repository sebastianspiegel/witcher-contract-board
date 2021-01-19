class MonstersController < ApplicationController

    def show
        @monster = Monster.find(params[:id])
    end

    def index
        @monsters = Monster.all[1..-1]
    end

    def new 
        @monster = Monster.new 
    end

    def create
        @monster = Monster.create(monster_params)
        redirect_to monster_path(@monster.id)
    end

    def edit
        @monster = Monster.find(params[:id])
    end

    def patch
        @monster = Monster.update(monster_params)
    end


    private

    def monster_params
        params.permit(:monster[:name], :monster[:type_id])
    end
end
