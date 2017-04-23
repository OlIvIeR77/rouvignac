class AddStreetNumberToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :street_number, :integer
  end
end
