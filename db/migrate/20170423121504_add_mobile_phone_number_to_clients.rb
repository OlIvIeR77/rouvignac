class AddMobilePhoneNumberToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :mobile_phone_number, :string
  end
end
