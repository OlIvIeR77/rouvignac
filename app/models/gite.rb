class Gite < ApplicationRecord

  serialize :beds, Array
  #attr_accessible :text1, :text2, :text3, :text4, :text5, :text6, :text7, :text8, :text9, :text10, :title, :image
  default_scope { where.not(title: "Prochainement") }
  #def to_param
  #  "#{id} #{title}".parameterize
  #end
  FURNITURES = {
    "140x190": 1,
    "160x190": 2,
    "90x190": 3,
    "90x200": 4
  }

  has_many :events
  has_many :reservations
  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :text10, ImageUploader
  mount_uploader :text9, ImageUploader
  mount_uploader :text8, ImageUploader
  mount_uploader :text7, ImageUploader
  mount_uploader :text6, ImageUploader
  mount_uploader :text5, ImageUploader
  mount_uploader :text4, ImageUploader
  mount_uploader :image, ImageUploader

  def surface
    text2.split(" ").last.gsub("(", "").gsub(")","")
  end

end
