class AddGiteIdToReservations < ActiveRecord::Migration[5.0]
  def change
    add_reference :reservations, :gite, foreign_key: true
  end
end
