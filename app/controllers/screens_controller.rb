class ScreensController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :admin_user, only: %i[index destroy edit update create]
  def show
    @show = Show.find(params[:show_id])
    @screen = Screen.find(1)
    @seats = CinenmaSeat.where(screen_id: @screen.id)
    # seat_reserveds = SeatReserved.where(show_id: @show.id)
    # Tim cinemaSeate ma co trong bang seatReserved voi dieu kien showid va status:true
    seat_reserveds = CinenmaSeat.includes(:seat_reserveds).where(seat_reserveds: { show_id: @show.id , status: true})
    @seat_reserveds_ids = seat_reserveds.pluck(:id)
  end

  def new
    @screen = Screen.new
  end
  
  def index
    @q = Screen.ransack(params[:q])
    @screens = @q.result(distinct: true)
  end

  def edit
    @screen = Screen.find(params[:id])
  end

  def update
    @screen = Screen.find(params[:id])
    screen_name = params[:screen][:name]
    if @screen.update(name: screen_name)
      flash[:success] = "Updated Screen" + @screen.name +  "!"
      redirect_to screens_path
    else
      flash[:danger] = "Fill up name input!"
      render 'edit'
    end
  end

  def create
    @screen = Screen.new
    @screen.name = params[:screen][:name]
    @screen.total_seat = 50
    if @screen.save
      flash[:success] = "Add new Genre " + @screen.name +  " successfully!"
      redirect_to screens_path
    else
      flash[:danger] = "Fill up name input!"
      render 'new'
    end
  end

  def destroy
    Screen.find(params[:id]).destroy
    flash[:success] = "Screen deleted"
    redirect_to screens_path
  end

end
