class Seat < ApplicationRecord
    belongs_to :seat_type
    belongs_to :screen
    has_many :seat_reserveds
end
