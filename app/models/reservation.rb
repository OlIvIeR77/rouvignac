class Reservation < ApplicationRecord
  belongs_to :client
  belongs_to :gite
  has_one :lease_agreement
end
