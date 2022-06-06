class Seat < ApplicationRecord
  belongs_to :seat_type
  belongs_to :screen
end
