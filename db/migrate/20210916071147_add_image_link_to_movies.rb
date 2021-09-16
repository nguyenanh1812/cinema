class AddImageLinkToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :image_link, :text
  end
end
