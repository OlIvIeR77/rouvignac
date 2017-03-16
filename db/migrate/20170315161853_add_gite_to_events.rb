class AddGiteToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :gite, foreign_key: true
  end
end
