class AddRowsToSeats < ActiveRecord::Migration[6.1]
  def change
    add_column :seats, :rows, :string
  end
end
