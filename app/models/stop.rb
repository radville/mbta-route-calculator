class Stop < ApplicationRecord
    has_many :routes, through: :route_stops
end
