class Gite < ApplicationRecord

  serialize :beds, Array
  #attr_accessible :text1, :text2, :text3, :text4, :text5, :text6, :text7, :text8, :text9, :text10, :title, :image
  default_scope { where.not(title: "Prochainement") }
  #def to_param
  #  "#{id} #{title}".parameterize
  #end

  def available_bed_furnitures
    all_bed_types = %w(bed_120x190 bed_160x200 bed_140x190 bed_90x190 bed_90x200 armchair_90x190)
    present_furnitures = []
    all_bed_types.each{|l| present_furnitures << l unless self.send(l) == 0 }
    present_furnitures
  end

  def get_beds
    self.available_bed_furnitures.map do |furniture|
      self.send(furniture).to_s + " " + I18n.t("crm.gites.#{furniture}")
    end
  end

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
