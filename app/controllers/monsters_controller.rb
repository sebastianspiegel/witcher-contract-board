class MonstersController < ApplicationController

    def show
        @monster = Monster.find(params[:id])
    end

    def index
        @monsters = Monster.all
        @types = Type.all
    end

    def new 
        redirect_if_not_logged_in
        if params[:type_id] && @type = Type.find(params[:type_id])
            @monster = Monster.new(type_id: params[:type_id])
        else
            @monster = Monster.new 
        end
    end

    def create
        @monster = Monster.create(monster_params)
        redirect_to monster_path(@monster.id)
    end

    def edit
        redirect_if_not_logged_in
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
