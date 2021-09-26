class AddSeatsNameToBookingTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :booking_tickets, :seats_name, :string
  end
end
