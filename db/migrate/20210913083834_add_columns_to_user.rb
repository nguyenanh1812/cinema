class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :day, :integer
    add_column :users, :month, :integer
    add_column :users, :year, :integer
  end
end
