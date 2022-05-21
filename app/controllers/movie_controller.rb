class MovieController < ApplicationController
  def new; end

  def index
    # @pagy, @movies = pagy(Movie.all, items: 9)

    @q = Movie.ransack(params[:q])
    @pagy, @movies = pagy(@q.result(distinct: true), items: 9)
  end

  def show
    @movie = Movie.find(params[:id])
    @genre = Genre.where(id: @movie.genre_id)
    @shows = Show.where(movie_id: @movie.id)
  end
end
