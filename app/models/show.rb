class Show < ApplicationRecord
    belongs_to :booking_ticket
    belongs_to :seat
    belongs_to :show
end
