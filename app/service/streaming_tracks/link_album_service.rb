# frozen_string_literal: true

module StreamingTracks
  class LinkAlbumService
    def execute!(
      id,
      params
    )
      column_name = detect_column_name(params)

      album = Album.with_tracks.
        find_by!(id: id)

      album.public_send("#{column_name}=", params[column_name])
      track_params = params[:tracks].reduce({}) { |acc, track_params|
        acc.merge(track_params[:track_number].to_i => track_params)
      }

      tracks = album.album_tracks.
        map { |album_track|
          track = album_track.track
          track.public_send(
            "#{column_name}=",
            track_params[album_track.track_number][column_name],
          )
          track
        }

      Album.transaction do
        album.save!
        tracks.each(&:save!)
      end
    end

    private

    def detect_column_name(params)
      [
        Streaming::KEY_SPOTIFY,
        Streaming::KEY_APPLE_MUSIC,
        Streaming::KEY_YOUTUBE_MUSIC,
      ].each do |column_name|
        return column_name if params.key?(column_name)
      end
    end
  end
end
