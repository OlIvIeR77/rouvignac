class Client < ApplicationRecord
  include Filterable
  has_many :reservations
  scope :search_by_last_name, -> (last_name) { where("last_name LIKE :search", search: "%#{last_name}%") }
end
