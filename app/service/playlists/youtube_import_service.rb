# frozen_string_literal: true

module Playlists
  class YoutubeImportService
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
        params,
        type,
        locale,
      )

      params[:tracks].each do |track_params|
        track = find_or_build_track(track_params)

        playlist.build_playlist_track(
          track,
          track_params[:position],
        )
      end

      playlist
    end

    def find_or_build_track(params)
      if track_cache.exists?(params[:youtube_video_id])
        return track_cache.find_by(params[:youtube_video_id])
      end

      track = Track.find_or_build_by(
        params,
        locale,
      ).tap { |o|
        o.artist = find_or_build_artist(
          o,
          params[:artist],
        )
      }
      track_cache[track.youtube_video_id] = track

      track
    end

    def find_or_build_artist(track, params)
      if track.artist.present?
        return track.artist
      end

      if artist_cache.exists?(params[:youtube_channel_id])
        return artist_cache.find_by(params[:youtube_channel_id])
      end

      artist = Artist.find_or_build_by(
        Streaming::Artists::KEY_YOUTUBE_MUSIC,
        params,
        locale,
      )
      artist_cache[artist.youtube_channel_id] = artist

      artist
    end

    def reset_cache(playlists_params)
      track_params_array = playlists_params.map { |playlist_params|
        playlist_params[:tracks]
      }.flatten

      @track_cache = Streaming::Tracks::Cache.new(
        Streaming::Tracks::KEY_YOUTUBE_MUSIC,
        track_params_array.map { |track_params|
          track_params[:youtube_video_id]
        },
      )

      @artist_cache = Streaming::Artists::Cache.new(
        Streaming::Artists::KEY_YOUTUBE_MUSIC,
        track_params_array.map { |track_params|
          track_params[:artist][:youtube_channel_id]
        },
      )
    end
  end
end
