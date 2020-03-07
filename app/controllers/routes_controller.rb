class RoutesController < ApplicationController
    def index
        # get route data from MBTA API
        Route.get_data

        # Display the route names at path /routes
        @routes = Route.all.map{ |route| route.name }

        # List the route names in the console
        @routes.each do |route|
            puts @routes
        end

        # Get Route with the most stops
        @most = Route.most

        # Get Route with the fewest stops
        @fewest = Route.fewest
    end
end
