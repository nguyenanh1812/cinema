class GenreController < ApplicationController
  before_action :admin_user, only: %i[index destroy edit update create]
  def new
    @genre = Genre.new
  end

  def index
    @genres = Genre.all
  end

  def destroy
    Genre.find(params[:id]).destroy
    flash[:success] = "Genre deleted"
    redirect_to genre_index_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    genre_name = params[:genre][:name]
    if @genre.update(name: genre_name)
      flash[:success] = "Updated Genre" + @genre.name +  "!"
      redirect_to genre_index_path
    else
      flash[:danger] = "Fill up name input!"
      render 'edit'
    end
  end

  def create
    @genre = Genre.new
    @genre.name = params[:genre][:name]
    if @genre.save
      flash[:success] = "Add new Genre " + @genre.name +  " successfully!"
      redirect_to genre_index_path
    else
      flash[:danger] = "Fill up name input!"
      render 'new'
    end
  end
end
