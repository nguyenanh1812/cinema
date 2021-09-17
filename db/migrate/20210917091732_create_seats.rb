class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.integer :screen_id
      t.integer :seat_type_id
      t.string :name

      t.timestamps
    end
  end
end
