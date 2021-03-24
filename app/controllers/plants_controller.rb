
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
        plant = Plant.new(plant_params(:name, :scientific_name, :image_link))
        if plant.save
            associate_growing_zones_with_new_plant(plant)
        end
        redirect_to plant_path(plant)
    end

    def edit
        @plant = Plant.find_by(id: params[:id])
        @growing_zones = GrowingZone.order(:name)
    end

    def update
        plant = Plant.find_by(id: params[:id])
        plant.update(plant_params(:name, :scientific_name, :image_link))
        if plant.save
            associate_growing_zones_with_new_plant(plant)
        end
        redirect_to plant_path(plant)
    end

    def delete
        plant = Plant.find_by(id: params[:id])
        plant.destroy
        redirect_to growing_zones_path
    end

    private

    def associate_growing_zones_with_new_plant(plant)
        growing_zone_ids.each do |i|
            gz = GrowingZone.find_by(zone_id: i)
            gz.plants << plant if gz.plants.none? {|p| p == plant}
        end
    end

    def growing_zone_ids
        params.require(:plant).require(:growing_zone).require(:zone_id)
    end

    def plant_params(*args)
        params.require(:plant).permit(*args)
    end

end