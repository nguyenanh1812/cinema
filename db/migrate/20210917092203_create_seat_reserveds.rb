class CreateSeatReserveds < ActiveRecord::Migration[6.1]
  def change
    create_table :seat_reserveds do |t|
      t.integer :cinenma_seat_id
      t.integer :booking_ticket_id
      t.integer :show_id
      t.boolean :status

      t.timestamps
    end
  end
end
