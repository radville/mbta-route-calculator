require "rails_helper"

#  run with rspec spec/models/route_spec.rb


RSpec.describe Route, type: :model do
  it "has a name" do 
    route = Route.create!(name: "Green Line") # creating a new stop instance
    expect(stop.name).to eq("Green Line") # the expectation
  end
end