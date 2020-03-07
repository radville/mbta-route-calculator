class AddMbtaIdToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :mbta_id, :string
  end
end
