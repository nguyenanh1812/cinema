class Show < ApplicationRecord
  has_many :booking_tickets
  belongs_to :movie, optional: true
  belongs_to :screen, optional: true

  validates :movie_id, presence: true
  validates :start_time, presence: true
  validates :screen_id, presence: true
  validates :end_time, presence: true
  validates :date, presence: true
  
  def get_movie
		Movie.find(self.movie_id)
	end
end
