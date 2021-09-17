class SeatReserved < ApplicationRecord
    belongs_to :booking_ticket
    belongs_to :show
    belongs_to :seats
end
