class TypesController < ApplicationController

    def show
        @type = Type.find(params[:id])
    end

    def index
        @types = Type.all[1..-1]
    end
end