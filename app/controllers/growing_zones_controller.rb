
class GrowingZonesController < ApplicationController

    def index
        @growing_zones = GrowingZone.all
    end

end

