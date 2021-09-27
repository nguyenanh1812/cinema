class BookingTicket < ApplicationRecord
    belongs_to :user
    belongs_to :show
    has_many :seat_reserveds
    has_many :cinenma_seats, through: :seat_reserveds
end
