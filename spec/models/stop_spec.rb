require "rails_helper"

#  run with rspec spec/models/stop_spec.rb

RSpec.describe Stop, type: :model do
  it "has a name" do 
    stop = Stop.create!(name: "Alewife") # creating a new stop instance
    expect(stop.name).to eq("Alewife") # the expectation
  end
end