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
    flash[:success] = "Đã xóa thể loại1"
    redirect_to genre_index_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    genre_name = params[:genre][:name]
    if @genre.update(name: genre_name)
      flash[:success] = "Cập nhật thể loại " + @genre.name +  " thành công!"
      redirect_to genre_index_path
    else
      flash[:danger] = "Hãy điền vào ô tên!"
      render 'edit'
    end
  end

  def create
    @genre = Genre.new
    @genre.name = params[:genre][:name]
    if @genre.save
      flash[:success] = "Thêm mới thể loại " + @genre.name +  " thành công!"
      redirect_to genre_index_path
    else
      flash[:danger] = "Điền vào ô tên!"
      render 'new'
    end
  end
end
