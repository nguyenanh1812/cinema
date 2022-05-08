class ScreensController < ApplicationController
  before_action :logged_in_user, only: [:show]
  def show
    @show = Show.find(params[:show_id])
    @screen = Screen.find(1)
    @seats = CinenmaSeat.where(screen_id: @screen.id)
    #seat_reserveds = SeatReserved.where(show_id: @show.id)
    #Tim cinemaSeate ma co trong bang seatReserved voi dieu kien showid
    seat_reserveds = CinenmaSeat.includes(:seat_reserveds).where(seat_reserveds: {show_id: @show.id})
    @seat_reserveds_ids = seat_reserveds.pluck(:id)
    
  end
end
