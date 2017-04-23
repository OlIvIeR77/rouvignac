class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.datetime :from
      t.datetime :to
      t.references :client, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
