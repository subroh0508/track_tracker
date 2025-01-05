# frozen_string_literal: true

module StreamingTracks
  class FindAlbumService
    include StreamingTracks::Common

    def execute!(
      brand,
      id
    )
      case brand
      when Api::SPOTIFY
        spotify_client.fetch_album(id, locale)
      when Api::YOUTUBE_MUSIC
        youtube_client.fetch_playlist(id, "ja")
      else
        raise ArgumentError, "Unknown brand: #{brand}"
      end
    end
  end
end
