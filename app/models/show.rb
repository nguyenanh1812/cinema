class Show < ApplicationRecord
  has_many :booking_tickets
  belongs_to :movie, optional: true
  belongs_to :screen, optional: true

  def get_movie
		Movie.find(self.movie_id)
	end
end
