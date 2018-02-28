class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.string :artist, null: false
      t.string :summary, null: false
      t.string :genre
      t.string :tracks, array: true, default: []

      t.timestamps
    end
  end
end
