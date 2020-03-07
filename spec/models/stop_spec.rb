require 'rails_helper'

#  run with rspec spec/models/route_spec.rb

RSpec.describe Stop, type: :model do
    it "has a name" do
        stop1 = Stop.create!(name: "Alewife") # creating a new stop instance
        expect(stop1.name).to eq("Alewife") # the expectation
    end
end
