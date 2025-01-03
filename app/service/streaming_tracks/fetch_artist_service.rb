# frozen_string_literal: true

module StreamingTracks
  class FetchArtistService
    def initialize(locale)
      @locale = locale
      @spotify_client = Api::SpotifyClient.new
      @youtube_client = Api::YoutubeClient.new
    end

    def execute!(brand, id)
      find_by(brand, id) || fetch(brand, id)
    end

    private

    attr_reader :locale, :spotify_client, :youtube_client

    def find_by(brand, id)
      key = brand_key(brand)
      artist = ::Artist.find_by(key => id)
      return nil if artist.blank?

      {
        brand_id: artist.public_send(key),
        name: artist.localized_name("ja"),
      }
    end

    def fetch(brand, id)
      case brand
      when Api::SPOTIFY
        result = spotify_client.fetch_artist(id, locale)
      when Api::YOUTUBE_MUSIC
        return nil
      when Api::APPLE_MUSIC
        return nil
      else
        return nil
      end

      return nil if result.blank?

      {
        brand_id: result[brand_key(brand)],
        name: result[:name],
      }
    end

    def brand_key(brand)
      case brand
      when Api::SPOTIFY
        Streaming::KEY_SPOTIFY
      when Api::YOUTUBE_MUSIC
        Streaming::KEY_YOUTUBE_MUSIC
      when Api::APPLE_MUSIC
        Streaming::KEY_APPLE_MUSIC
      else
        throw ArgumentError.new("Unknown brand: #{brand}")
      end
    end
  end
end
