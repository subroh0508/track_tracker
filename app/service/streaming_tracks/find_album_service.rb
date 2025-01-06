# frozen_string_literal: true

module StreamingTracks
  class FindAlbumService
    include StreamingTracks::Common

    def execute!(params)
      case
      when params.key?(Streaming::KEY_SPOTIFY)
        spotify_client.fetch_album(params[Streaming::KEY_SPOTIFY], locale)
      when params.key?(Streaming::KEY_YOUTUBE_MUSIC)
        youtube_client.fetch_playlist(params[Streaming::KEY_YOUTUBE_MUSIC], "ja")
      else
        raise ArgumentError, "Unknown brand: #{brand}"
      end
    end
  end
end
