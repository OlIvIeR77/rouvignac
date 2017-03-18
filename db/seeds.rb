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
	prixa2: "3 semaines : 850 €<br/> 1 semaine : 430 €<br/>W-E : 215 €",
	prixa3: "3 semaines : 680 €<br/> 1 semaine : 340 €<br/>W-E : 170 €",
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
	prixi2: "3 semaines : 690 €<br/> 1 semaine : 350 €<br/>W-E : 175 €",
	prixi3: "3 semaines : 560 €<br/> 1 semaine : 280 €<br/>W-E : 140 €",
	prixk1: "3 semaines : 650 €<br/> 1 semaine : 325 €<br/>W-E : 160 €",
	prixk2: "3 semaines : 370 €<br/> 1 semaine : 190 €<br/>W-E : 95 €",
	prixk3: "3 semaines : 310 €<br/> 1 semaine : 160 €<br/>W-E : 80 €",
	prixl1: "3 semaines : 835 €<br/> 1 semaine : 425 €<br/>W-E : 210 €",
	prixl2: "3 semaines : 530 €<br/> 1 semaine : 270 €<br/>W-E : 135 €",
	prixl3: "3 semaines : 450 €<br/> 1 semaine : 240 €<br/>W-E : 120 €"
	)

admin = Admin.create!(:email => 'rouvignac@gmail.com', :password => 'rouvignac@gmail.com', :password_confirmation => 'rouvignac@gmail.com')
puts 'New admin created: ' << admin.email


Gite.create!(:title => "Althéa", :text1 => "f4-sort", :text2 => "7-8 Personnes (88m2)",
	:text3 => 	"Rez-de-chaussée : salle de séjour (cheminée), cuisine. <br/>
	1er étage : salon TV (canapé-lit 2 places 140 x 190), chambre 1 (lit 2 places 160 x 200), TV, salle de bains, WC séparé. <br/>
	2ème étage : chambre 2 (trois lits : 2 lits 90 x 190, 1 lit 120 x 190), salle de douche, WC. <br/>
	Chauffage central au gaz, lave linge, lave vaisselle, gazinière, micro-ondes. <br/>
	Jardin terrasse, salon de jardin. Si besoin, mise à disposition lit de bébé et chaise. Barbecue commun.", :text9 => File.open(File.join(Rails.root, '/public/giteA2.jpg')), :text10 => File.open(File.join(Rails.root, '/public/giteA1.jpg')) )

Gite.create!(:title => "Bégonia", :text1 => "f5-sort", :text2 => "8 Personnes (92m2)",
	:text3 => "Rez-de-chaussée : salle de séjour (cheminée), cuisine <br/>
	1er étage : salon TV (canapé lit 2 places 140 x 190), chambre 1 (lit 2 places 160 x 200), TV, salle de bains, WC séparé. <br/>
	2ème étage : chambre 2 (deux lits 1 personne : 90 x 190), chambre 3 (2 lits une place superposés 90 x 190), salle de douche, WC. <br/>
	Chauffage central au gaz, lave linge, lave vaisselle, réfrigérateur-congélateur, gazinière, micro-ondes. <br/>
	Jardin terrasse, salon de jardin. Si besoin, mise à disposition lit de bébé et chaise. Barbecue commun.", :text9 => File.open(File.join(Rails.root, '/public/giteB2.jpg')), :text10 => File.open(File.join(Rails.root, '/public/giteB1.jpg')))

Gite.create!(:title => "Camélia", :text1 => "studio-mezzanine-sort", :text2 => "2-4 Personnes (44m2)",
	:text3 => "Rez-de-chaussée : salle de séjour (canapé-lit 90 x 190 + tiroir-lit 90 x 190), coin cuisine, salle de douche, WC séparé. <br/>
	Chambre en mezzanine ( 15m2, lit 2 places 160 x 200, nombreux rangements). <br/>
	Chauffage au gaz, TV, gazinière, micro-ondes, réfrigérateur-congélateur, lave-linge, jardin terrasse, salon de jardin. Si besoin, mise à disposition lit de bébé et chaise. Lave-linge dans buanderie commune. Barbecue commun.", :text9 => File.open(File.join(Rails.root, '/public/giteC2.jpg')), :text10 => File.open(File.join(Rails.root, '/public/giteC1.jpg')))

Gite.create!(:title => "Dahlia", :text1 => "f2-sort", :text2 => "2-3 Personnes (33m2)",
	:text3 => "Rez-de-chaussée : salle de séjour (canapé-lit 90 x 190), coin cuisine. <br/>
	1er étage : chambre lit 140 x 190, salle de douche, WC. <br/>
	Chauffage au gaz, TV, gazinière, micro-ondes, réfrigérateur-congélateur, lave-linge en buanderie. <br/>
	Jardin terrasse, salon de jardin. Si besoin, mise à disposition lit de bébé et chaise. Barbecue commun.", :text9 => File.open(File.join(Rails.root, '/public/giteD2.jpg')), :text10 => File.open(File.join(Rails.root, '/public/giteD1.jpg')))

Gite.create!(:title => "Erica", :text1 => "f2-sort", :text2 => "2-3 Personnes (33m2)",
	:text3 => "Rez-de-chaussée : salle de séjour (canapé-lit 90 x 190), coin cuisine. <br/>
	1er étage : chambre lit 140 x 190, salle de douche, WC. <br/>
	Chauffage au gaz, TV, gazinière, micro-ondes, réfrigérateur-congélateur, lave-linge en buanderie. <br/>
	Jardin terrasse, salon de jardin. Si besoin, mise à disposition lit de bébé et chaise. Barbecue commun.", :text9 => File.open(File.join(Rails.root, '/public/giteE2.jpg')), :text10 => File.open(File.join(Rails.root, '/public/giteE1.jpg')))

Gite.create!(:title => "Fuchsia", :text1 => "studio-mezzanine-sort", :text2 => "2-3 Personnes (30m2)",
	:text3 => "Rez-de-chaussée : salle de séjour (fauteuil-lit 90 x 190), coin cuisine. Salle de bains, WC. <br/>
	1er étage : Chambre en mezzanine, lit 140 x 190, rangements. <br/>
	Chauffage au gaz, TV, gazinière, micro-ondes, réfrigérateur congélateur, lave-linge en buanderie. <br/>
	Jardin terrasse, salon de jardin. Si besoin, mise à disposition lit de bébé et chaise. Barbecue commun.", :text9 => File.open(File.join(Rails.root, '/public/giteF2.jpg')), :text10 => File.open(File.join(Rails.root, '/public/giteF1.jpg')))

Gite.create!(:title => "Gardénia", :text1 => "f2-sort", :text2 => "2-4 Personnes (45m2)",
	:text3 => "Salle de séjour : (canapé-lit 90 x 190 + lit tiroir 90 x 190), coin cuisine. <br/>
	Chambre lit 140 x 190, salle de douche (à l'italienne) -  WC. <br/>
	Chauffage électrique, TV, gazinière, micro-ondes, réfrigérateur-congélateur. <br/>
	Jardin terrasse, salon de jardin. Lave linge dans la buanderie en annexe. Si besoin, mise à disposition lit de bébé et chaise. Barbecue commun.", :text9 => File.open(File.join(Rails.root, '/public/giteG2.jpg')), :text10 => File.open(File.join(Rails.root, '/public/giteG1.jpg')))

Gite.create!(:title => "Hortensia", :text1 => "studio-sort", :text2 => "1-2 Personnes (25m2)",
	:text3 => "Rez de chaussée : salle de séjour, coin cuisine. <br/>
	Chambre : lit 140 x 190, salle de douche (à l'italienne), WC. <br/>
	Chauffage électrique, TV, gazinière, micro-ondes, réfrigérateur congélateur, lave-linge en buanderie.. <br/>
	Jardin terrasse, salon de jardin. Si besoin, mise à disposition lit de bébé et chaise. Barbecue commun.", :text9 => File.open(File.join(Rails.root, '/public/giteH2.jpg')), :text10 => File.open(File.join(Rails.root, '/public/giteH1.jpg')))

Gite.create!(:title => "Iris", :text1 => "f3-sort", :text2 => "5-6 Personnes (47m2)",
	:text3 => "Rez de chaussée : salle de séjour, coin cuisine (fauteuil-lit 90 x 190). <br/>
	Chambre : lit 140 x 190, salle de douche , WC. <br/>
	Chambre enfants : 3 lits 90 x 200 - douche, WC. <br/>
	Chauffage électrique, TV, micro-ondes, four électrique, plaques éléctriques, réfrigérateur-congélateur, lave-linge en buanderie. <br/>
	Jardin terrasse, salon de jardin. Si besoin, mise à disposition lit de bébé et chaise. Barbecue commun.", :text9 => File.open(File.join(Rails.root, '/public/giteI2.jpg')), :text10 => File.open(File.join(Rails.root, '/public/giteI1.jpg')))

Gite.create!(:title => "Kiwi", :text1 => "studio-sort", :text2 => "1-2 Personnes (19m2)",
	:text3 => "Rez de chaussée, salle de séjour, coin cuisine. Canapé-lit 140 x 190, salle de douche - WC. <br/>
	Chauffage électrique, TV, plaques éléctriques, micro-ondes, réfrigérateur-congélateur, lave-linge en buanderie. <br/>
	Jardin terrasse, salon de jardin. Si besoin, mise à disposition lit de bébé et chaise. Barbecue commun.", :text9 => File.open(File.join(Rails.root, '/public/giteK2.jpg')), :text10 => File.open(File.join(Rails.root, '/public/giteK1.jpg')))

Gite.create!(:title => "Lilas", :text1 => "f2-sort", :text2 => "2-3 Personnes (26m2)",
	:text3 => "Rez de chaussée, salle de séjour, coin cuisine (fauteuil-lit 90 x 190). <br/>
	Chambre : lit 140 x 190, salle de douche (à l'italienne), WC. <br/>
	Chauffage électrique, TV, gazinière, micro-ondes, four électrique, réfrigérateur-congélateur, lave-linge en buanderie. <br/>
	Jardin terrasse, salon de jardin. Si besoin, mise à disposition lit de bébé et chaise. Barbecue commun.", :text9 => File.open(File.join(Rails.root, '/public/giteL2.jpg')), :text10 => File.open(File.join(Rails.root, '/public/giteL1.jpg')))

Gite.create!(:title => "Prochainement", :text2 => "D'autres gîtes à venir !!", :text3 => "Description du site", :text9 => File.open(File.join(Rails.root, '/public/under-construction.jpg')), :text10 => File.open(File.join(Rails.root, '/public/under-construction2.jpg')))





puts "Gites created !!!"
