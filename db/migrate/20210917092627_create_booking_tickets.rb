class CreateBookingTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_tickets do |t|
      t.integer :user_id
      t.integer :total_price

      t.timestamps
    end
  end
end
