class AddFurnituresInfosToGites < ActiveRecord::Migration[5.0]
  def change
    add_column :gites, :bed_120x190, :integer, default: 0
    add_column :gites, :bed_160x200, :integer, default: 0
    add_column :gites, :bed_140x190, :integer, default: 0
    add_column :gites, :bed_90x190, :integer, default: 0
    add_column :gites, :bed_90x200, :integer, default: 0
    add_column :gites, :armchair_90x190, :integer, default: 0
    add_column :gites, :energy_type, :string, default: "electrical"
  end
end
