class Movie < ApplicationRecord
  belongs_to :genre, optional: true
  has_many :shows
  validates :name, presence: true, length: { maximum: 35 }
end
