class CreateTracks < ActiveRecord::Migration[8.0]
  def change
    create_table :tracks, id: :uuid do |t|
      t.string :spotify_id
      t.string :youtube_music_id
      t.string :apple_music_id
      t.integer :disc_number, null: false
      t.integer :track_number, null: false
      t.integer :duration_ms, null: false
      t.references :album, null: false, foreign_key: { on_delete: :cascade }, type: :uuid

      t.timestamps
    end

    add_index :tracks, :spotify_id, unique: true
    add_index :tracks, :youtube_music_id, unique: true
    add_index :tracks, :apple_music_id, unique: true

    add_index :tracks, [:id, :album_id], unique: true

    create_table :translations_tracks, id: :uuid do |t|
      t.string :title, null: false
      t.string :locale, null: false
      t.references :track, null: false, foreign_key: { on_delete: :cascade }, type: :uuid

      t.timestamps
    end

    create_table :track_artists, id: :uuid do |t|
      t.references :track, null: false, foreign_key: { on_delete: :cascade }, type: :uuid
      t.references :artist, null: false, foreign_key: { on_delete: :cascade }, type: :uuid

      t.timestamps
    end

    add_index :track_artists, [:track_id, :artist_id], unique: true
  end
end
