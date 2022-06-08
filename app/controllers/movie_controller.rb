class MovieController < ApplicationController
  before_action :admin_user, only: [:new]
  def new
    @movie = Movie.new
    @movie_genre = Genre.all
  end

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

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_index_path
    else
      redirect_to movie_new_path
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :title, :cast, :time, :description, :release, :image_link, :genre_id)
  end
end
