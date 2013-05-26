class CreateTarifs < ActiveRecord::Migration
  def change
    create_table :tarifs do |t|
      t.text :year
      t.text :prixa1
      t.text :prixa2
      t.text :prixa3
      t.text :prixb1
      t.text :prixb2
      t.text :prixb3
      t.text :prixc1
      t.text :prixc2
      t.text :prixc3
      t.text :prixd1
      t.text :prixd2
      t.text :prixd3
      t.text :prixe1
      t.text :prixe2
      t.text :prixe3
      t.text :prixf1
      t.text :prixf2
      t.text :prixf3
      t.text :prixg1
      t.text :prixg2
      t.text :prixg3
      t.text :prixh1
      t.text :prixh2
      t.text :prixh3
      t.text :prixi1
      t.text :prixi2
      t.text :prixi3
      t.text :prixj1
      t.text :prixj2
      t.text :prixj3
      t.text :prixk1
      t.text :prixk2
      t.text :prixk3
      t.text :prixl1
      t.text :prixl2
      t.text :prixl3

      t.timestamps
    end
  end
end
