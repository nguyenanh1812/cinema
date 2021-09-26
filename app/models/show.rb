class Show < ApplicationRecord
    has_many :booking_tickets
    belongs_to :movie   , optional: true
    belongs_to :screen  , optional: true
end
