class CreateArtists < ActiveRecord::Migration[8.0]
  def change
    create_table :artists, id: :uuid do |t|
      t.string :youtube_channel_id

      t.timestamps
    end

    create_table :translations_artists, id: :uuid do |t|
      t.string :name, null: false
      t.string :locale, null: false
      t.references :artist, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
