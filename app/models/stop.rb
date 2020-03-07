class Stop < ApplicationRecord
    has_many :route_stops
    has_many :routes, through: :route_stops

    validates_uniqueness_of :name

end
