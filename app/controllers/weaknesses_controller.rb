class WeaknessesController < ApplicationController



    def new 
        redirect_if_not_logged_in
        @weakness = Weakness.new 
        @monster = Monster.find(params[:monster_id])
    end

    def create
        @monster = Monster.find(params[:monster_id])
        if params[:weakness][:id] != ""
            @weakness = Weakness.find(params[:weakness][:id])
        else
            @weakness = Weakness.new(weakness_params)
            if !@weakness.save 
                redirect_to new_monster_weakness_path(@monster.id)
            end
        end
        @monster.weaknesses << @weakness 
        redirect_to monster_path(@monster.id)
    end


    private

    def weakness_params
        params.require(:weakness).permit(:id, :name, :weakness_type_id)
    end
end