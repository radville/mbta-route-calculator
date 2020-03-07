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

    # fetch data about all stops at each Route
    def self.get_stops
        # if Route.all.first.stops.size < 1
            self.all.each do |route|
                stops_response = RestClient.get("https://api-v3.mbta.com/stops?filter[route]=#{route.mbta_id}&api_key=#{ENV['MBTA_KEY']}")

                stops_data = JSON.parse(stops_response)["data"]

                stops_data.each do |stop_el| 
                    if !Stop.where(name: stop_el["attributes"]["name"])
                        route.stops.create(name: stop_el["attributes"]["name"])
                    else
                        binding.pry
                        Stop.where(name: stop_el["attributes"]["name"]).routes << route
                    end
                end
            end
        # end
    end

    # Calculate Route with most stops
    def self.most 
        self.get_stops
        self.all.sort_by{ |route| route.stops.length }[-1]
    end

    def self.fewest
        self.all.sort_by{ |route| route.stops.length }[0]
    end


end
