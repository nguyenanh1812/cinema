class ShowsController < ApplicationController
  before_action :admin_user, only: %i[index destroy edit update create]
  def index
    #@shows = Show.all
    @movie = Movie.all
    @screen = Screen.all
    @q = Show.ransack(params[:q])
    @shows = @q.result
  end

  def new
    @show = Show.new
    @movies = Movie.all
    @screens = Screen .all
  end

  def edit
    @show = Show.find(params[:id])
    @movies = Movie.all
    @screens = Screen .all
  end

  def update
    @show = Show.find(params[:id])
    movie_id = params[:show][:movie_id]
    screen_id = params[:show][:screen_id]
    start_time = params[:show][:start_time]
    end_time = params[:show][:end_time]
    date = params[:show][:date]
    if @genre.update(movie_id: movie_id, screen_id: screen_id, start_time: start_time, end_time: end_time, date: date)
      flash[:success] = "Updated show" + @show.movie.name +  "!"
      redirect_to shows_index_path
    else
      flash[:danger] = "Fill up the form!"
      render 'edit'
    end
  end

  def create
    @movies = Movie.all
    @screens = Screen .all
    @show = Show.new
    @show.movie_id = params[:show][:movie_id]
    @show.screen_id = params[:show][:screen_id]
    @show.start_time = params[:show][:start_time]
    @show.end_time = params[:show][:end_time]
    @show.date = params[:show][:date]
    if @show.save
      flash[:success] = "Add new Show " + @show.movie.name +  " successfully!"
      redirect_to shows_index_path
    else
      flash[:danger] = "Fill up the form!"
      render 'new'
    end
  end

  def destroy
    Show.find(params[:id]).destroy
    flash[:success] = "Show deleted"
    redirect_to shows_index_path
  end
end
