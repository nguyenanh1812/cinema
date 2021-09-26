class CinenmaSeat < ApplicationRecord
    belongs_to :screen
    has_many :seat_reserveds
end
