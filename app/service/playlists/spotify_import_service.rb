# frozen_string_literal: true

module Playlists
  class SpotifyImportService
    KEY = Streaming::Artists::KEY_SPOTIFY

    def initialize(locale, type)
      @locale = locale
      @type = Playlist.types[type.to_sym]
    end

    def execute!(playlists_params)
      reset_cache(playlists_params)

      Playlist.transaction do
        playlists = playlists_params.map { |playlist_params|
          find_or_build_playlist(playlist_params)
        }

        playlists.each(&:save!)
      end
    end

    private

    attr_reader :locale, :type, :track_cache, :artist_cache

    def find_or_build_playlist(params)
      playlist = Playlist.find_or_build_by(
        KEY,
        params,
        type,
        locale,
      )

      params[:tracks].each do |track_params|
        track = find_or_build_track(track_params)

        playlist.build_playlist_track(
          track,
          track_params[:track_number],
          params[:thumbnail_url],
        )
      end

      playlist
    end

    def find_or_build_track(params)
      if track_cache.exists?(params[KEY])
        return track_cache.find_by(params[KEY])
      end

      track = Track.find_or_build_by(
        KEY,
        params,
        locale,
      ).tap { |o|
        o.artists = params[:artists].map { |artist_params|
          find_or_build_artist(artist_params)
        }
      }
      track_cache[track.public_send(KEY.to_s)] = track

      track
    end

    def find_or_build_artist(params)
      if artist_cache.exists?(params[KEY])
        return artist_cache.find_by(params[KEY])
      end

      artist = Artist.find_or_build_by(
        KEY,
        params,
        locale,
      )
      artist_cache[artist.public_send(KEY.to_s)] = artist

      artist
    end

    def reset_cache(playlists_params)
      track_params_array = playlists_params.map { |playlist_params|
        playlist_params[:tracks]
      }.flatten

      @track_cache = Streaming::Tracks::Cache.new(
        KEY,
        track_params_array.map { |track_params|
          track_params[KEY]
        },
      )

      @artist_cache = Streaming::Artists::Cache.new(
        KEY,
        track_params_array.map { |track_params|
          track_params[:artists].map { |artist_params|
            artist_params[KEY]
          }
        }.flatten,
      )
    end
  end
end
