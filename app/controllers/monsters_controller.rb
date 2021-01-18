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
        @monster = Monster.create(name: params[:monster][:name], type_id: params[:monster][:type_id])
        redirect_to monster_path(@monster.id)
    end

    private

    def monster_params
        params.permit(:name, :type_id)
    end
end
