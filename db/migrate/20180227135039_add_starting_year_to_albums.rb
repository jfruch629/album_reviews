class AddStartingYearToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :starting_year, :string, null: false
  end
end
