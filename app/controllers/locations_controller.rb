class LocationsController < ApplicationController
    def index
        @locations = Location.all[1..-1]
    end
end