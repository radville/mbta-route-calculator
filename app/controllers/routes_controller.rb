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
    end
end
