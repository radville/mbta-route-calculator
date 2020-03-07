class Route < ApplicationRecord
    has_many :stops, through: :route_stops
end
