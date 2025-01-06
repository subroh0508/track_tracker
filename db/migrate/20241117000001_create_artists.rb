class CreateArtists < ActiveRecord::Migration[8.0]
  def change
    create_table :artists, id: :uuid do |t|
      t.string :spotify_id
      t.string :youtube_music_id
      t.string :apple_music_id

      t.timestamps
    end

    add_index :artists, :spotify_id, unique: true
    # add_index :artists, :youtube_music_id, unique: true
    add_index :artists, :apple_music_id, unique: true

    create_table :translations_artists, id: :uuid do |t|
      t.string :name, null: false
      t.string :locale, null: false
      t.references :artist, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
