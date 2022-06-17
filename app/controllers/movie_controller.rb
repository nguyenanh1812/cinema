class MovieController < ApplicationController
  before_action :admin_user, only: %i[:new index2 update destroy]
  def new
    @movie = Movie.new
    @movie_genre = Genre.all
  end

  def destroy
    Movie.find(params[:id]).destroy
    flash[:success] = "Phim đã được xóa!"
    redirect_to movie_index2_path
  end

  def index
    # @pagy, @movies = pagy(Movie.all, items: 9)
    @q = Movie.ransack(params[:q])
    @pagy, @movies = pagy(@q.result(distinct: true), items: 9)
  end
  
  def index2
    @q = Movie.ransack(params[:q])
    @pagy, @movies = pagy(@q.result(distinct: true), items: 9)
  end
  
  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:success] = "Cập nhật thành công!"
      redirect_to movie_index2_path
    else
      render 'edit'
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @genre = Genre.where(id: @movie.genre_id)
    @shows = Show.where(movie_id: @movie.id)
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:success] = "Thêm phim mới thành công!"
      redirect_to movie_index2_path
    else
      redirect_to movie_new_path
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :title, :cast, :time, :description, :release, :image_link, :genre_id)
  end
end
