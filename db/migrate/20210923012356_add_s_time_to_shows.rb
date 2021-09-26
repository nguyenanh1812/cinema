class AddSTimeToShows < ActiveRecord::Migration[6.1]
  def change
    add_column :shows, :start_time, :string
  end
end
