class SeatReserved < ApplicationRecord
  belongs_to :booking_ticket
  belongs_to :cinenma_seat
end
