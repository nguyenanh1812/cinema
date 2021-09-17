class BookingTicket < ApplicationRecord
    belongs_to :user
    has_many :seat_reserveds
end
