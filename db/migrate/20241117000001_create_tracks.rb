class CreateTracks < ActiveRecord::Migration[8.0]
  def change
    create_table :tracks, id: :uuid do |t|
      t.string :title, null: false

      t.timestamps
    end

    create_table :translations_tracks, id: :uuid do |t|
      t.string :title, null: false
      t.string :locale, null: false
      t.references :track, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
