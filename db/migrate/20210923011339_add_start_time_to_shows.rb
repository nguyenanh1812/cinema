class AddStartTimeToShows < ActiveRecord::Migration[6.1]
  def change
    add_column :shows, :strat_time, :string
  end
end
