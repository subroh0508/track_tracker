# frozen_string_literal: true

module StreamingTracks
  class LinkAlbumService
    include StreamingTracks::StreamingService

    def execute!(
      id,
      params
    )
      column_name = detect_streaming_service_id_column_name(params)

      album = ::Album.find_by!(id: id)

      album.public_send(
        "#{column_name}=",
        params[column_name],
      )

      track_params = sort_tracks_to_simple_array(
        params[:tracks].map { |track_params|
          Track.build(
            :disc_number => track_params[:disc_number],
            :track_number => track_params[:track_number],
            column_name => track_params[column_name],
          )
        },
      )

      tracks = sort_tracks_to_simple_array(album.tracks.to_a).
        map.with_index { |track, i|
          track.public_send(
            "#{column_name}=",
            track_params[i].public_send(column_name),
          )
          track
        }

      ::Album.transaction do
        album.save!
        tracks.each(&:save!)
      end
    end

    private

    def sort_tracks_to_simple_array(tracks)
      if tracks[0].disc_number.nil?
        tracks.sort_by(&:track_number)
      else
        tracks.sort_by { |track| [track.disc_number, track.track_number] }
      end
    end
  end
end
