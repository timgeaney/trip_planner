class AddColumnDescriptionToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :description, :string
  end
end
