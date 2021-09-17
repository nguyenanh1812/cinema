class CreateSeatReserveds < ActiveRecord::Migration[6.1]
  def change
    create_table :seat_reserveds do |t|
      t.integer :seat_id
      t.integer :booking_id
      t.integer :show_id
      t.boolean :status

      t.timestamps
    end
  end
end
