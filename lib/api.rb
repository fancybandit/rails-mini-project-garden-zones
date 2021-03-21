require 'net/http'
require 'json'
require 'pry'

class API

    BASE_PLANT_URL = "https://trefle.io/api/v1/plants"
    BASE_ZONE_URL = "https://trefle.io/api/v1/distributions/"
    
    def get_zone_page(endpoint)
        uri = URI(BASE_ZONE_URL + endpoint)
        Net::HTTP.get_response(uri)
    end
        
    def parse_zone_body(endpoint)
        body = get_zone_page(endpoint).body
        JSON.parse(body)
    end

    def get_zone_name(zone_id)
        json = parse_zone_body("#{zone_id}/?token=#{ENV["API_KEY"]}")
        json["data"]["name"]
    end

    # def get_plant_page(endpoint)
    #     uri = URI(BASE_URL + endpoint)
    #     Net::HTTP.get_response(uri)
    # end

    # def parse_body(endpoint)
    #     body = get_page(endpoint).body
    #     json = JSON.parse(body)
    #     binding.pry
    # end

end

