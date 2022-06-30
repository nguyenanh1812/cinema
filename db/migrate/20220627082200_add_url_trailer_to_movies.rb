class AddUrlTrailerToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :url_trailer, :string
  end
end
