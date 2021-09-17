class CreateShows < ActiveRecord::Migration[6.1]
  def change
    create_table :shows do |t|
      t.integer :movie_id
      t.integer :screen_id
      t.datetime :date
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
