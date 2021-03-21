
class GrowingZonesController < ApplicationController

    def index
        @growing_zones = GrowingZone.order(:created_at)
    end

    def show
        @growing_zone = GrowingZone.find_by(params[:id])
    end

end

