class CreateAlbums < ActiveRecord::Migration[8.0]
  def change
    create_table :album_tracks, id: :uuid do |t|
      t.integer :disc_number, null: false
      t.integer :track_number, null: false
      t.string :isrc, null: false
      t.references :album, null: false, foreign_key: true, type: :uuid
      t.references :track, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :album_tracks, [:album_id, :track_id], unique: true
  end
end
