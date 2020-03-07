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

    # def self.list_connections
    #     Stop.with_connections.map do |stop|
    #         stop.name + "-" + list_routes(stop)
    #     end.to_s
    # end

    # def list_routes(stop)
    #     stop.routes.each { |r| r.name }
    # end

end
