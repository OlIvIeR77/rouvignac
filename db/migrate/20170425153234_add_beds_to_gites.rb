class AddBedsToGites < ActiveRecord::Migration[5.0]
  def change
    add_column :gites, :beds, :string, array: true, default: []
  end
end
