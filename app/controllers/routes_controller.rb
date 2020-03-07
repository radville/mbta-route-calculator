class RoutesController < ApplicationController
    def index
        # get route data from MBTA API
        routes_response = RestClient.get("https://api-v3.mbta.com/routes?filter[type]=0,1&api_key=#{ENV['MBTA_KEY']}")

        routes_data = JSON.parse(routes_response)["data"]

        # Create Routes from the parsed data
        routes_data.map do |route|
            Route.create(name: route["attributes"]["long_name"], mbta_id: route["id"])
        end

        # Display the route names at path /routes
        @routes = Route.all.map{ |route| route.name }

        # List the route names in the console
        @routes.each do |route|
            puts @routes
        end
    end
end
