class AddImageToGites < ActiveRecord::Migration
  def change
    add_column :gites, :image, :string
  end
end
