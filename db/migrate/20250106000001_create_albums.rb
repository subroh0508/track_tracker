class CreateAlbums < ActiveRecord::Migration[8.0]
  def change
    create_table :albums, id: :uuid do |t|
      t.string :spotify_id
      t.string :youtube_music_id
      t.string :apple_music_id
      t.string :thumbnail_url, null: false
      t.string :release_date, null: false

      t.timestamps
    end

    add_index :albums, :spotify_id, unique: true
    add_index :albums, :youtube_music_id, unique: true
    add_index :albums, :apple_music_id, unique: true

    create_table :translations_albums, id: :uuid do |t|
      t.string :title, null: false
      t.string :locale, null: false
      t.references :albums, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
