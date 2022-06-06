class Screen < ApplicationRecord
  has_many :seats
  has_many :shows
end
