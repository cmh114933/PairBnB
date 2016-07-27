class AddReservationCountToListings < ActiveRecord::Migration
  def change
    add_column :listings, :reservations_count, :integer, default: 0
  end
end