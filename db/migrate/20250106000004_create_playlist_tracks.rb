class CreatePlaylistTracks < ActiveRecord::Migration[8.0]
  def change
    create_table :playlist_tracks, id: :uuid do |t|
      t.integer :track_number, null: false
      t.string :thumbnail_url, null: false
      t.references :playlist, null: false, foreign_key: { on_delete: :cascade }, type: :uuid
      t.references :track, null: false, foreign_key: { on_delete: :cascade }, type: :uuid

      t.timestamps
    end

    add_index :playlist_tracks, [:playlist_id, :track_id, :track_number], unique: true
  end
end
