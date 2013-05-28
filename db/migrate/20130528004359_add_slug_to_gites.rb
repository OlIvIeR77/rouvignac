class AddSlugToGites < ActiveRecord::Migration
  def change
    add_column :gites, :slug, :string
    add_index :gites, :slug
  end
end
