# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_01_06_000003) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "album_artists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "album_id", null: false
    t.uuid "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id", "artist_id"], name: "index_album_artists_on_album_id_and_artist_id", unique: true
    t.index ["album_id"], name: "index_album_artists_on_album_id"
    t.index ["artist_id"], name: "index_album_artists_on_artist_id"
  end

  create_table "album_tracks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "disc_number", null: false
    t.integer "track_number", null: false
    t.string "isrc", null: false
    t.uuid "album_id", null: false
    t.uuid "track_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id", "track_id"], name: "index_album_tracks_on_album_id_and_track_id", unique: true
    t.index ["album_id"], name: "index_album_tracks_on_album_id"
    t.index ["track_id"], name: "index_album_tracks_on_track_id"
  end

  create_table "albums", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "spotify_id"
    t.string "youtube_music_id"
    t.string "apple_music_id"
    t.string "ean"
    t.string "upc"
    t.string "thumbnail_url", null: false
    t.string "release_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apple_music_id"], name: "index_albums_on_apple_music_id", unique: true
    t.index ["spotify_id"], name: "index_albums_on_spotify_id", unique: true
    t.index ["youtube_music_id"], name: "index_albums_on_youtube_music_id", unique: true
  end

  create_table "artists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "spotify_id"
    t.string "youtube_music_id"
    t.string "apple_music_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apple_music_id"], name: "index_artists_on_apple_music_id", unique: true
    t.index ["spotify_id"], name: "index_artists_on_spotify_id", unique: true
  end

  create_table "playlist_tracks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "track_number", null: false
    t.string "thumbnail_url", null: false
    t.uuid "playlist_id", null: false
    t.uuid "track_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id", "track_id"], name: "index_playlist_tracks_on_playlist_id_and_track_id", unique: true
    t.index ["playlist_id"], name: "index_playlist_tracks_on_playlist_id"
    t.index ["track_id"], name: "index_playlist_tracks_on_track_id"
  end

  create_table "playlists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "spotify_id"
    t.string "youtube_music_id"
    t.string "apple_music_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apple_music_id"], name: "index_playlists_on_apple_music_id", unique: true
    t.index ["spotify_id"], name: "index_playlists_on_spotify_id", unique: true
    t.index ["youtube_music_id"], name: "index_playlists_on_youtube_music_id", unique: true
  end

  create_table "track_artists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "track_id", null: false
    t.uuid "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_track_artists_on_artist_id"
    t.index ["track_id"], name: "index_track_artists_on_track_id"
  end

  create_table "tracks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "spotify_id"
    t.string "youtube_music_id"
    t.string "apple_music_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apple_music_id"], name: "index_tracks_on_apple_music_id", unique: true
    t.index ["spotify_id"], name: "index_tracks_on_spotify_id", unique: true
    t.index ["youtube_music_id"], name: "index_tracks_on_youtube_music_id", unique: true
  end

  create_table "translations_albums", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.string "locale", null: false
    t.uuid "albums_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["albums_id"], name: "index_translations_albums_on_albums_id"
  end

  create_table "translations_artists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "locale", null: false
    t.uuid "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_translations_artists_on_artist_id"
  end

  create_table "translations_playlists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.string "locale", null: false
    t.uuid "playlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id"], name: "index_translations_playlists_on_playlist_id"
  end

  create_table "translations_tracks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.string "locale", null: false
    t.uuid "track_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["track_id"], name: "index_translations_tracks_on_track_id"
  end

  add_foreign_key "album_artists", "albums"
  add_foreign_key "album_artists", "artists"
  add_foreign_key "album_tracks", "albums"
  add_foreign_key "album_tracks", "tracks"
  add_foreign_key "playlist_tracks", "playlists"
  add_foreign_key "playlist_tracks", "tracks"
  add_foreign_key "track_artists", "artists"
  add_foreign_key "track_artists", "tracks"
  add_foreign_key "translations_albums", "albums", column: "albums_id"
  add_foreign_key "translations_artists", "artists"
  add_foreign_key "translations_playlists", "playlists"
  add_foreign_key "translations_tracks", "tracks"
end
