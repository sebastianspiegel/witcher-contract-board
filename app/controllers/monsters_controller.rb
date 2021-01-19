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

    def update
        @monster = Monster.find(params[:id])
        @monster.update(monster_params)
        redirect_to monster_path(@monster.id)
    end

    def destroy
        @monster = Monster.find(params[:id])
        @monster.destroy 
        redirect_to monsters_path 
    end


    private

    def monster_params
        params.require(:monster).permit(:name, :type_id)
    end
end
