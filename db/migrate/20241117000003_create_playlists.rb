class CreatePlaylists < ActiveRecord::Migration[8.0]
  def change
    create_table :playlists, id: :uuid do |t|
      t.string :spotify_id
      t.string :youtube_music_id
      t.string :apple_music_id

      t.timestamps
    end

    create_table :translations_playlists, id: :uuid do |t|
      t.string :title, null: false
      t.string :locale, null: false
      t.references :playlist, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :playlists, :spotify_id, unique: true
    add_index :playlists, :youtube_music_id, unique: true
    add_index :playlists, :apple_music_id, unique: true
  end
end
