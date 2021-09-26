class AddNumberOfSeatsToBookingTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :booking_tickets, :seat_quantity, :integer
    add_column :booking_tickets, :creat_at, :date
    add_column :booking_tickets, :status, :boolean
    add_column :booking_tickets, :show_id, :integer
  end
end
