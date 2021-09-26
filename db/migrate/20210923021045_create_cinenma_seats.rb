class CreateCinenmaSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :cinenma_seats do |t|
      t.integer :row
      t.integer :seat_number
      t.integer :price
      t.integer :screen_id

      t.timestamps
    end
  end
end
