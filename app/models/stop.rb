class Stop < ApplicationRecord
    has_many :route_stops
    has_many :routes, through: :route_stops

    # validates_uniqueness_of :name

    def self.with_connections
        stops = []

        Stop.all.each do |stop|
            if stop.routes.length > 1
                stops.push(stop)
            end
        end
        
        stops.sort_by!{ |s| s.name }
    end

    def self.get_stops_from_params(params)
        @stop1 = Stop.find(params["stop_1"]["stop_id"])
        @stop2 = Stop.find(params["stop_2"]["stop_id"])
    end

    def self.connect_stops(params)
        self.get_stops_from_params(params)

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
        end
        
    end

    def self.display_connections(params)
        self.get_stops_from_params(params)
        @stop1.name + " to " + @stop2.name + " --> " + Stop.connect_stops(params)
    end

end
