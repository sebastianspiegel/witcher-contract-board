class LocationsController < ApplicationController
    def index
        @locations = Location.all
        @dangertown = Location.with_most_monsters
    end
end