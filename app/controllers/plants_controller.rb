
class PlantsController < ApplicationController

    def show
        @plant = Plant.find_by(id: params[:id])
        if @plant
            @growing_zones = @plant.growing_zones.order(:name)
        else
           redirect_to growing_zones_path
        end
    end

    def new
        @plant = Plant.new
        @growing_zones = GrowingZone.order(:name)
    end

    def create
        binding.pry
        # plant = Plant.new(plant_params(:name, :scientific_name, :image_link))
        # plant.save
        redirect_to plant_path(plant)
    end

    private

    def plant_params(*args)
        params.require(:plant).permit(*args)
    end

end