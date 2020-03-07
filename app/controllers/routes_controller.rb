class RoutesController < ApplicationController
    def index
        routes_response = RestClient.get("https://api-v3.mbta.com/routes?filter[type]=0,1&api_key=#{ENV['MBTA_KEY']}")

        routes_data = JSON.parse(routes_response)["data"]

        # Display the route names at path /routes
        @routes = routes_data.map do |route|
            route["attributes"]["long_name"]
        end

        # List the route names in the console
        @routes.each do |route|
            puts @routes
        end

    end
end
