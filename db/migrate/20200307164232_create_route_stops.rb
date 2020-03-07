class CreateRouteStops < ActiveRecord::Migration[5.1]
  def change
    create_table :route_stops do |t|
      t.integer :stop_id
      t.integer :route_id

      t.timestamps
    end
  end
end
