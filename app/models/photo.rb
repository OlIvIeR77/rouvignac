class Photo < ActiveRecord::Base
  attr_accessible :content, :image, :title
  mount_uploader :image, ImageUploader
end
