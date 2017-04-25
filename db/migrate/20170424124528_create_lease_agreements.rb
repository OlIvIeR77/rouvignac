class CreateLeaseAgreements < ActiveRecord::Migration[5.0]
  def change
    create_table :lease_agreements do |t|
      t.references :reservation, foreign_key: true
      t.string :pdf_path

      t.timestamps
    end
  end
end
