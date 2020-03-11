class Stop < ApplicationRecord
    has_many :route_stops
    has_many :routes, through: :route_stops

    # return stops that connect 2 or more routes
    def self.with_connections
        stops = []

        Stop.all.each do |stop|
            if stop.routes.length > 1
                stops.push(stop)
            end
        end
        
        stops.sort_by{ |s| s.name }
    end

    # given the params from the search page, find the two stops
    def self.get_stops_from_params(params)
        @stop1 = Stop.find(params["stop_1"]["stop_id"])
        @stop2 = Stop.find(params["stop_2"]["stop_id"])
    end

    # find the route that connects two stops
    def self.connect_stops(line_out)
        stop1_available = @stop1.routes-[line_out]
        stop2_available = @stop2.routes-[line_out]

        # if don't need any transfers
        if (stop1_available & stop2_available).any?
            (stop1_available & stop2_available)[0].name

        # if need one transfer: 
        elsif Stop.with_connections.any? do |stop| 
                stop_available = stop.routes - [line_out]
                stop_available.routes & stop1_available).any? && (stop_available.routes & stop2_available).any?
            end
            @stop1_available[0].name + ", " + @stop2.routes[0].name + " via " \
            + Stop.with_connections.find { |stop| (stop.routes & stop1_available).any? && (stop.routes & stop2_available).any? }.name

        # if need two transfers
        else
            # add case where there need to be 2 or more transfers
            "TBD: You need more than 1 transfer!"
        end
        
    end

    # display the two stops and their connecting route
    def self.display_connections(params)
        self.get_stops_from_params(params)
        line_out = Route.find(params["route"]["route_id"])
        @stop1.name + " to " + @stop2.name + " --> " + Stop.connect_stops(line_out)
    end

end
