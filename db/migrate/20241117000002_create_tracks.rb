class CreateTracks < ActiveRecord::Migration[8.0]
  def change
    create_table :tracks, id: :uuid do |t|
      t.string :spotify_id
      t.string :youtube_music_id
      t.string :apple_music_id
      t.references :artist, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    create_table :translations_tracks, id: :uuid do |t|
      t.string :title, null: false
      t.string :locale, null: false
      t.references :track, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :tracks, :spotify_id, unique: true
    add_index :tracks, :youtube_music_id, unique: true
    add_index :tracks, :apple_music_id, unique: true
  end
end
