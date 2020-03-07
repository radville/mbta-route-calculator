class Route < ApplicationRecord
    has_many :route_stops
    has_many :stops, through: :route_stops

    validates_uniqueness_of :mbta_id

    # get routes data from MBTA API
    def self.get_data
        routes_response = RestClient.get("https://api-v3.mbta.com/routes?filter[type]=0,1&api_key=#{ENV['MBTA_KEY']}")

        routes_data = JSON.parse(routes_response)["data"]

        # Create Routes from the parsed data
        routes_data.map do |route|
            Route.create(name: route["attributes"]["long_name"], mbta_id: route["id"])
        end
    end

    # Calculate Route with most stops
    def self.most 
        self.sort_by{ |route| route.stops.length }[0]
    end
end
