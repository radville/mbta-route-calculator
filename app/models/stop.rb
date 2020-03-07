class Stop < ApplicationRecord
    has_many :route_stops
    has_many :routes, through: :route_stops

    # validates_uniqueness_of :name

    def self.stops_with_connections
        stops = []
        Stop.all.each do |stop|
            if stop.routes.length > 1
                stops.push(stop)
            end
        end
        stops.sort
    end

end
