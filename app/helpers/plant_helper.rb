
module PlantHelper
    def related?(growing_zone)
        growing_zone.plants.include?(@plant)
    end
end

