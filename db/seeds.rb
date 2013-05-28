# encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Tarif.create!(
	year: "Tarifs 2013",
	prixa1: "3 semaines : 1195 €<br/> 1 semaine : 600 €<br/>W-E : 295 €",
	prixa2: "3 semaines : 1195 €<br/> 1 semaine : 600 €<br/>W-E : 295 €",
	prixa3: "3 semaines : 1195 €<br/> 1 semaine : 600 €<br/>W-E : 295 €",
	prixb1: "3 semaines : 1390 €<br/> 1 semaine : 695 €<br/>W-E : 345 €",
	prixb2: "3 semaines : 910 €<br/> 1 semaine : 450 €<br/>W-E : 225 €",
	prixb3: "3 semaines : 770 €<br/> 1 semaine : 385 €<br/>W-E : 195 €",
	prixc1: "3 semaines : 900 €<br/> 1 semaine : 450 €<br/>W-E : 225 €",
	prixc2: "3 semaines : 575 €<br/> 1 semaine : 290 €<br/>W-E : 145 €",
	prixc3: "3 semaines : 470 €<br/> 1 semaine : 240 €<br/>W-E : 120 €",
	prixd1: "3 semaines : 835 €<br/> 1 semaine : 425 €<br/>W-E : 210 €",
	prixd2: "3 semaines : 530 €<br/> 1 semaine : 270 €<br/>W-E : 135 €",
	prixd3: "3 semaines : 450 €<br/> 1 semaine : 240 €<br/>W-E : 120 €",
	prixe1: "3 semaines : 835 €<br/> 1 semaine : 425 €<br/>W-E : 210 €",
	prixe2: "3 semaines : 530 €<br/> 1 semaine : 270 €<br/>W-E : 135 €",
	prixe3: "3 semaines : 450 €<br/> 1 semaine : 240 €<br/>W-E : 120 €",
	prixf1: "3 semaines : 785 €<br/> 1 semaine : 390 €<br/>W-E : 195 €",
	prixf2: "3 semaines : 495 €<br/> 1 semaine : 250 €<br/>W-E : 125 €",
	prixf3: "3 semaines : 430 €<br/> 1 semaine : 220 €<br/>W-E : 110 €",
	prixg1: "3 semaines : 900 €<br/> 1 semaine : 450 €<br/>W-E : 225 €",
	prixg2: "3 semaines : 575 €<br/> 1 semaine : 290 €<br/>W-E : 145 €",
	prixg3: "3 semaines : 470 €<br/> 1 semaine : 240 €<br/>W-E : 120 €",
	prixh1: "3 semaines : 730 €<br/> 1 semaine : 365 €<br/>W-E : 185 €",
	prixh2: "3 semaines : 420 €<br/> 1 semaine : 215 €<br/>W-E : 105 €",
	prixh3: "3 semaines : 340 €<br/> 1 semaine : 165 €<br/>W-E : 85 €",
	prixi1: "3 semaines : 1040 €<br/> 1 semaine : 515 €<br/>W-E : 255 €",
	prixi2: "3 semaines : 340 €<br/> 1 semaine : 165 €<br/>W-E : 85 €",
	prixi3: "3 semaines : 340 €<br/> 1 semaine : 165 €<br/>W-E : 85 €",
	prixk1: "3 semaines : 650 €<br/> 1 semaine : 325 €<br/>W-E : 160 €",
	prixk2: "3 semaines : 370 €<br/> 1 semaine : 190 €<br/>W-E : 95 €",
	prixk3: "3 semaines : 310 €<br/> 1 semaine : 160 €<br/>W-E : 80 €",
	prixl1: "3 semaines : 835 €<br/> 1 semaine : 425 €<br/>W-E : 210 €",
	prixl2: "3 semaines : 530 €<br/> 1 semaine : 270 €<br/>W-E : 135 €",
	prixl3: "3 semaines : 450 €<br/> 1 semaine : 240 €<br/>W-E : 120 €"
	)

admin = Admin.create!(:email => 'rouvignac@gmail.com', :password => '23021999', :password_confirmation => '23021999')
puts 'New admin created: ' << admin.email


Gite.create!(:title => "Althea", :text1 => "f4-sort", :text2 => "7-8 Personnes",:text3 => "Description du site", :text9 => "/giteA2.jpg", :text10 => "/giteA1.jpg")
Gite.create!(:title => "Begonia", :text1 => "f5-sort", :text2 => "8 Personnes",:text3 => "Description du site", :text9 => "/giteB2.jpg", :text10 => "/giteB1.jpg")
Gite.create!(:title => "Camelia", :text1 => "studio-mezzanine-sort", :text2 => "2-4 Personnes",:text3 => "Description du site", :text9 => "/giteC2.jpg", :text10 => "/giteC1.jpg")
Gite.create!(:title => "Dhalia", :text1 => "f2-sort", :text2 => "2-3 Personnes",:text3 => "Description du site", :text9 => "/giteD2.jpg", :text10 => "/giteD1.jpg")
Gite.create!(:title => "Erica", :text1 => "f2-sort", :text2 => "2-3 Personnes",:text3 => "Description du site", :text9 => "/giteE2.jpg", :text10 => "/giteE1.jpg")
Gite.create!(:title => "Fuchsia", :text1 => "studio-mezzanine-sort", :text2 => "2-3 Personnes",:text3 => "Description du site", :text9 => "/giteF2.jpg", :text10 => "/giteF1.jpg")
Gite.create!(:title => "Gardenia", :text1 => "f2-sort", :text2 => "2-4 Personnes",:text3 => "Description du site", :text9 => "/giteG2.jpg", :text10 => "/giteG1.jpg")
Gite.create!(:title => "Hortensia", :text1 => "studio-sort", :text2 => "1-2 Personnes",:text3 => "Description du site", :text9 => "/giteH2.jpg", :text10 => "/giteH1.jpg")
Gite.create!(:title => "Iris", :text1 => "f3-sort", :text2 => "5-6 Personnes",:text3 => "Description du site", :text9 => "/giteI2.jpg", :text10 => "/giteI1.jpg")
Gite.create!(:title => "Kiwi", :text1 => "studio-sort", :text2 => "1-2 Personnes",:text3 => "Description du site", :text9 => "/giteK2.jpg", :text10 => "/giteK1.jpg")
Gite.create!(:title => "Lila", :text1 => "f2-sort", :text2 => "2-3 Personnes",:text3 => "Description du site", :text9 => "/giteL2.jpg", :text10 => "/giteL1.jpg")
Gite.create!(:title => "Prochainement", :text2 => "D'autres gîtes à venir !!",:text3 => "Description du site", :text9 => "/under-construction.jpg", :text10 => "/under-construction2.jpg")



puts "Gites created !!!"


