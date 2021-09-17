class CreateScreens < ActiveRecord::Migration[6.1]
  def change
    create_table :screens do |t|
      t.string :name
      t.integer :total_seat

      t.timestamps
    end
  end
end
