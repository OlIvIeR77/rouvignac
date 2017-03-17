class Event < ApplicationRecord

    belongs_to :gite
    validate :already_booked, on: :create
    validate :available, on: :update
    validates :start_at, :end_at, presence: true

    def already_booked
      unless self.gite.events.where(start_at: start_at..end_at - 1.day)
              .or(self.gite.events.where(end_at: start_at.end_of_day..end_at.end_of_day + 1.day))
                .or(self.gite.events.where("start_at <= :start_at AND end_at > :start_at", start_at: start_at)
                  .or(self.gite.events.where("start_at < :end_at AND end_at >= :end_at", end_at: end_at))).empty?
        errors.add(:already_booked, "Was already_booked")
      end
    end

    def available
      #binding.pry
      unless self.gite.events.where(start_at: start_at..end_at - 1.day).or(self.gite.events.where(end_at: start_at.end_of_day..end_at.end_of_day + 1.day)).or(self.gite.events.where("start_at < :start_at AND end_at > :end_at", start_at: start_at, end_at: end_at)).where.not(id: id).empty?
        errors.add(:already_booked, "Was already_booked")
      end
    end

end
