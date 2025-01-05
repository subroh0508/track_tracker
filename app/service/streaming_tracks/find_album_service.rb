# frozen_string_literal: true

module StreamingTracks
  class FindAlbumService
    def initialize(locale)
      @locale = locale
      @spotify_client = Api::SpotifyClient.new
      @youtube_client = Api::YoutubeClient.new
    end

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

    private

    attr_reader :locale, :spotify_client, :youtube_client
  end
end
