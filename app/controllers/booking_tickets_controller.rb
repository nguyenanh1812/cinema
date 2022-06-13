class BookingTicketsController < ApplicationController
  before_action :admin_user, only: %i[index2 destroy]
  def index
    @booking_ticket = BookingTicket.where(user_id: current_user.id)
    @shows = Show.all
    @movies = Movie.all
  end

  def index2
    @q = BookingTicket.ransack(params[:q])
    @booking_tickets = @q.result(distinct: true)
    @shows = Show.all
    @movies = Movie.all
    #@users = User.all
  end

  def destroy
    BookingTicket.find(params[:id]).destroy
    flash[:success] = "Ticket deleted"
    redirect_to ticket_list_path
  end

  def show
    @booking_ticket = BookingTicket.find(params[:id])
    @show = Show.find(@booking_ticket.show_id)
    @screen = Screen.find(@show.screen_id)
    @movie = Movie.find(@show.movie_id)
  end

  def new
    @booking_ticket = BookingTicket.new
    @show = Show.find(params[:show_id])
    @movie = Movie.find(@show.movie_id)
  end

  def create
    #binding.pry
    @booking_ticket = BookingTicket.new(booking_params)
    @booking_ticket.status = false

    list_seat_ids = params[:booking_ticket][:seats_ids]
    
    if @booking_ticket.save
      # save vao seat reserved
      list_ids = list_seat_ids.split(',')
      list_ids.length.times do |index|
        @seat_reserved = SeatReserved.new
        @seat_reserved.cinenma_seat_id = list_ids[index].to_i # list_seat_ids[index]
        @seat_reserved.show_id = @booking_ticket.show_id
        @seat_reserved.booking_ticket_id = @booking_ticket.id
        @seat_reserved.status = false
        @seat_reserved.save
      end
      flash[:info] = 'Bạn đã đặt vé thành công!'
      redirect_to root_url
    else
      flash[:danger] = 'Lỗi hệ thống, vui lòng quay lại sau!'
      render 'new'
    end
  end

  private

  def booking_params
    {
      user_id: params[:booking_ticket][:user_id],
      seat_quantity: params[:booking_ticket][:seat_quantity],
      total_price: params[:booking_ticket][:total_price],
      show_id: params[:booking_ticket][:show_id],
      seats_name: params[:booking_ticket][:seats_name]
    }
  end
end
