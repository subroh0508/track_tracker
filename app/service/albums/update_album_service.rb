# frozen_string_literal: true

module Albums
  class UpdateAlbumService
    include StreamingService::Common
    include StreamingTracks::Common

    def execute!(
      id,
      params: {},
      streaming_service: nil
    )
      album = ::Album.find(id)

      if streaming_service.blank?
        album.update!(
          title: params[:title],
          spotify_id: params[StreamingService::KEY_SPOTIFY],
          apple_music_id: params[StreamingService::KEY_APPLE_MUSIC],
          youtube_music_id: params[StreamingService::KEY_YOUTUBE_MUSIC],
        )
        return album
      end

      column_name = detect_column_name_by_streaming_service_name(streaming_service)
      reset_cache(column_name, params)

    end

    private

    def fetch_album_from_streaming_service(
      params,
      streaming_service
    )
      case streaming_service
      when Api::SPOTIFY
        spotify_client.fetch_album(
          params[StreamingService::KEY_SPOTIFY],
          Api::Spotify::MARKET_JP,
        )
      when Api::APPLE_MUSIC
        nil
      else
        nil
      end
    end
  end
end
