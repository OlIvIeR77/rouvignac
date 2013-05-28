class Gite < ActiveRecord::Base
  attr_accessible :text1, :text10, :text2, :text3, :text4, :text5, :text6, :text7, :text8, :text9, :title
  
  #def to_param
  #  "#{id} #{title}".parameterize
  #end
  extend FriendlyId
  friendly_id :title, use: :slugged

end
