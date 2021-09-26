class BookingTicketsController < ApplicationController
  def index
    @booking_ticket = BookingTicket.where(user_id: current_user.id)
    @shows = Show.all
    @movies = Movie.all
  end

  def show
    @booking_ticket = BookingTicket.find(params[:id])
  end

  def new
    @booking_ticket = BookingTicket.new
    @show = Show.find(params[:show_id])
    @movie = Movie.find(@show.movie_id)
  end
  def create
    @booking_ticket = BookingTicket.new(booking_params)
      if @booking_ticket.save
        #@seat_reserved = SeatReserved.new
        flash[:info] = "Ban da dat ve thanh cong"
        redirect_to root_url
      else
        render 'new'  
      end
  end

  private
  def booking_params
    params.require(:booking_ticket).permit(:user_id, :seat_quantity,:total_price, :creat_at, :show_id, :seats_name ) 
  end

end
