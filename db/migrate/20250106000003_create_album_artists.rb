class CreateAlbumArtists < ActiveRecord::Migration[8.0]
  def change
    create_table :album_artists, id: :uuid do |t|
      t.references :album, null: false, foreign_key: true, type: :uuid
      t.references :artist, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :album_artists, [:album_id, :artist_id], unique: true
  end
end
