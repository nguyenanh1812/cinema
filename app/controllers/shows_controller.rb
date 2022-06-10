class ShowsController < ApplicationController
  def index
    @movies = Movie.all
    @shows = Show.where(movie_id: params[:id])
  end

  def show
    @movies = Movie.all
    @shows = Show.where(movie_id: params[:id])
  end

  def new
  end
  
  def listindex
  end

  def edit
  end

  def update
  end

  def create
  end
end
