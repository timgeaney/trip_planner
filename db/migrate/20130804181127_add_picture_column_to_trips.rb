class AddPictureColumnToTrips < ActiveRecord::Migration
  def change
    add_attachment :trips, :picture
  end
end
