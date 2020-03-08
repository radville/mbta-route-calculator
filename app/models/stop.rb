class Stop < ApplicationRecord
    has_many :route_stops
    has_many :routes, through: :route_stops

    # validates_uniqueness_of :name

    # return stops that connect 2 or more routes
    def self.with_connections
        stops = []

        Stop.all.each do |stop|
            if stop.routes.length > 1
                stops.push(stop)
            end
        end
        
        stops.sort_by!{ |s| s.name }
    end

    # given the params from the search page, find the two stops
    def self.get_stops_from_params(params)
        @stop1 = Stop.find(params["stop_1"]["stop_id"])
        @stop2 = Stop.find(params["stop_2"]["stop_id"])
    end

    # find the route that connects two stops
    def self.connect_stops
        # if don't need any transfers
        if @stop1.routes.find { |route| @stop2.routes.include?(route) }
            @stop1.routes.find { |route| @stop2.routes.include?(route) }.name

        # if need one transfer: 
        elsif Stop.with_connections.any? { |stop| stop.routes.include?(@stop1.routes[0] && @stop2.routes[0]) }
            @stop1.routes[0].name + ", " + @stop2.routes[0].name + " via " \
            + Stop.with_connections.find { |stop| stop.routes.include?(@stop1.routes[0] && @stop2.routes[0]) }.name
            
        # if need two transfers
        else
            # add case where there need to be 2 or more transfers
            "TDB"
        end
        
    end

    # display the two stops and their connecting route
    def self.display_connections(params)
        self.get_stops_from_params(params)
        @stop1.name + " to " + @stop2.name + " --> " + Stop.connect_stops
    end

end
