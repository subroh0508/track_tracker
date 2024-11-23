class CreatePlaylistTracks < ActiveRecord::Migration[8.0]
  def change
    create_table :playlist_tracks, id: :uuid do |t|
      t.integer :position, null: false
      t.references :playlist, null: false, foreign_key: true, type: :uuid
      t.references :track, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
