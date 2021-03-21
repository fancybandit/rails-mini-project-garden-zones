require_relative '../lib/api'

zone_ids = [10, 11, 12, 13, 14, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 40, 41, 42, 43, 50, 51, 60, 61, 62, 63, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 90, 91]

zone_ids.each do |zone_id|
    name = API.new.get_zone_name(zone_id)
    growing_zone = GrowingZone.find_by(name: name)
    if !growing_zone
        growing_zone = GrowingZone.new(name: name, zone_id: zone_id)
        growing_zone.save
    end
end