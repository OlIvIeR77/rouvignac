class RemoveAddressFromClients < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :address, :string
  end
end
