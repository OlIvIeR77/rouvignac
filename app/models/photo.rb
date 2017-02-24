class Photo < ApplicationRecord
  #attr_accessible :content, :image, :title
  mount_uploader :image, ImageUploader
end
