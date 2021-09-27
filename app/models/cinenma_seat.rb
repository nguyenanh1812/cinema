class CinenmaSeat < ApplicationRecord
    belongs_to :screen
    has_many :seat_reserveds
    has_many :booking_tickets, through: :seat_reserveds
end
