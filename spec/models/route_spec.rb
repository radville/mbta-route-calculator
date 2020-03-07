require 'rails_helper'

#  run with rspec spec/models/route_spec.rb

RSpec.describe Route, type: :model do
    it "has a name" do
        route = Route.create!(name: "Green Line") # creating a new route instance
        expect(route.name).to eq("Green Line") # the expectation
    end

    it "has stops" do
        route = Route.create!(name: "Blue Line")
        route.stops.build(name: "Wonderland") 
        expect(route.stops.first.name).to eq("Wonderland")
    end
end
