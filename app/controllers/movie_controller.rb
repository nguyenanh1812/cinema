class MovieController < ApplicationController
  def new
  end
  
  def index 
    @pagy, @movies = pagy(Movie.all, items: 3)
  end
  
  def show
    @movie = Movie.find(params[:id])
    @genre = Genre.where(id: @movie.genre_id)
  end

end
