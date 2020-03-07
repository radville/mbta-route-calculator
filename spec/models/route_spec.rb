require 'rails_helper'

#  run with rspec spec/models/route_spec.rb

RSpec.describe Route, type: :model do
    it "has a name" do
        route = Route.create!(name: "Alewife") # creating a new stop instance
        expect(route.name).to eq("Alewife") # the expectation
    end
end
