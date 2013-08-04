class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string    :title
      t.datetime  :startdate
      t.datetime  :enddate
      t.string    :destination
      t.string    :purpose
      t.integer   :user_id

      t.timestamps
    end

    add_index :trips, [:user_id, :created_at]
  end
end
