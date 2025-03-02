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

ActiveRecord::Schema[8.0].define(version: 2025_02_16_075835) do
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

  create_table "albums", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "spotify_id"
    t.string "youtube_music_id"
    t.string "apple_music_id"
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
    t.index ["playlist_id", "track_id", "track_number"], name: "idx_on_playlist_id_track_id_track_number_0d87f92cb8", unique: true
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
    t.index ["track_id", "artist_id"], name: "index_track_artists_on_track_id_and_artist_id", unique: true
    t.index ["track_id"], name: "index_track_artists_on_track_id"
  end

  create_table "tracks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "spotify_id"
    t.string "youtube_music_id"
    t.string "apple_music_id"
    t.integer "disc_number", null: false
    t.integer "track_number", null: false
    t.uuid "album_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_tracks_on_album_id"
    t.index ["apple_music_id"], name: "index_tracks_on_apple_music_id", unique: true
    t.index ["id", "album_id"], name: "index_tracks_on_id_and_album_id", unique: true
    t.index ["spotify_id"], name: "index_tracks_on_spotify_id", unique: true
    t.index ["youtube_music_id"], name: "index_tracks_on_youtube_music_id", unique: true
  end

  create_table "translations_albums", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.string "locale", null: false
    t.uuid "album_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_translations_albums_on_album_id"
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

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "album_artists", "albums", on_delete: :cascade
  add_foreign_key "album_artists", "artists", on_delete: :cascade
  add_foreign_key "playlist_tracks", "playlists", on_delete: :cascade
  add_foreign_key "playlist_tracks", "tracks", on_delete: :cascade
  add_foreign_key "track_artists", "artists", on_delete: :cascade
  add_foreign_key "track_artists", "tracks", on_delete: :cascade
  add_foreign_key "tracks", "albums", on_delete: :cascade
  add_foreign_key "translations_albums", "albums", on_delete: :cascade
  add_foreign_key "translations_artists", "artists", on_delete: :cascade
  add_foreign_key "translations_playlists", "playlists", on_delete: :cascade
  add_foreign_key "translations_tracks", "tracks", on_delete: :cascade
end
