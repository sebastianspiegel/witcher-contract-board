class LocationsController < ApplicationController
    def index
        @locations = Location.all
        @dangertown = Location.with_most_monsters
        @richtown = Location.richest_location
    end
end