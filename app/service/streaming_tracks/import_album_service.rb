# frozen_string_literal: true

module StreamingTracks
  class ImportAlbumService
    include StreamingTracks::StreamingService

    def initialize(locale)
      @locale = locale
    end

    def execute!(albums_params)
      column_name = detect_streaming_service_id_column_name(albums_params[0])

      reset_cache(column_name, albums_params)

      ::Album.transaction do
        albums = albums_params.map { |album_params|
          album = find_or_build_album(column_name, album_params)
          album.artists = album_params[:artists].map { |artist_params|
            find_or_build_artist(column_name, artist_params)
          }

          album
        }

        albums.each(&:save!)
      end
    end

    private

    attr_reader :locale, :type, :track_cache, :artist_cache

    def find_or_build_album(column_name, params)
      album = ::Album.find_or_build_by(
        column_name,
        params,
        locale,
      )

      params[:tracks].each do |track_params|
        track = find_or_build_track(
          column_name,
          track_params,
        )
        track.album = album
      end

      album
    end

    def find_or_build_track(column_name, params)
      if track_cache.exists?(params[column_name])
        return track_cache.find_by(params[column_name])
      end

      track = Track.find_or_build_by(
        column_name,
        params,
        locale,
      ).tap { |o|
        o.artists = params[:artists].map { |artist_params|
          find_or_build_artist(column_name, artist_params)
        }
      }
      track_cache[track.public_send(column_name.to_s)] = track

      track
    end

    def find_or_build_artist(column_name, params)
      if artist_cache.exists?(params[column_name])
        return artist_cache.find_by(params[column_name])
      end

      artist = Artist.find_or_build_by(
        column_name,
        params,
        locale,
      )
      artist_cache[artist.public_send(column_name.to_s)] = artist

      artist
    end

    def reset_cache(column_name, albums_params)
      track_params_array = albums_params.map { |album_params|
        album_params[:tracks]
      }.flatten

      artist_params_array = albums_params.map { |album_params|
        album_params[:artists]
      }.flatten + track_params_array.map { |track_params|
        track_params[:artists]
      }.flatten

      @track_cache = Streaming::Tracks::Cache.new(
        column_name,
        track_params_array.map { |track_params|
          track_params[column_name]
        },
      )

      @artist_cache = Streaming::Artists::Cache.new(
        column_name,
        artist_params_array.map { |artist_params|
          artist_params[column_name]
        },
      )
    end
  end
end
