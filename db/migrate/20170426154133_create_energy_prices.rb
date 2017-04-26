class CreateEnergyPrices < ActiveRecord::Migration[5.0]
  def change
    create_table :energy_prices do |t|
      t.string :energy_type
      t.float :price

      t.timestamps
    end
  end
end
