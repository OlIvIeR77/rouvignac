class ChangeClientsNumberColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :clients, :number, :number_of_person
  end
end
