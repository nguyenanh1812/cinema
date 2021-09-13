class AddFavoriteCinemaToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :favorite_cinema, :string
  end
end
