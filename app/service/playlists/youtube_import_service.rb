# frozen_string_literal: true

module Playlists
  class YoutubeImportService
    def initialize(locale, type)
      @locale = locale
      @type = type
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

    attr_reader :locale, :type, :track_cache

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
        o.artist = find_or_build_artist(params[:artist])
      }
      track_cache[track.youtube_video_id] = track

      track
    end

    def find_or_build_artist(params)
      Artist.find_or_build_by(
        Streaming::Artists::KEY_YOUTUBE_MUSIC,
        params,
        locale,
      )
    end

    def reset_cache(playlists_params)
      @track_cache = Streaming::Tracks::Cache.new(
        Streaming::Tracks::KEY_YOUTUBE_MUSIC,
        playlists_params.map { |playlist_params|
          playlist_params[:tracks].map { |track_params|
            track_params[:youtube_video_id]
          }
        }.flatten,
      )
    end
  end
end
