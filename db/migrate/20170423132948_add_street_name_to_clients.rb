class AddStreetNameToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :street_name, :string
  end
end
