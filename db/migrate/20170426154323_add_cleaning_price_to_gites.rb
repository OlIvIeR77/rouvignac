class AddCleaningPriceToGites < ActiveRecord::Migration[5.0]
  def change
    add_column :gites, :cleaning_price, :integer, default: 60
  end
end
