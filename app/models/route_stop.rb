class RouteStop < ApplicationRecord
    belongs_to :route
    belongs_to :stop
end
