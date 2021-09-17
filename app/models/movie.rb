class Movie < ApplicationRecord
    belongs_to :genre, optional: true
    has_many :shows
end
