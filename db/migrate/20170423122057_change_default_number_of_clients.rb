class ChangeDefaultNumberOfClients < ActiveRecord::Migration[5.0]
  def up
    change_column_default(:clients, :number, 1)
  end
  def down
    change_column_default(:clients, :number, nil)
  end
end
