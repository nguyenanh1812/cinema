class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :title
      t.string :cast
      t.text :description
      t.string :time
      t.date :release
      t.integer :gerne_id

      t.timestamps
    end
  end
end
