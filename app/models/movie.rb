class Movie < ApplicationRecord
    belongs_to :genre, optional: true
end
