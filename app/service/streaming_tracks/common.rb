# frozen_string_literal: true

module StreamingTracks
  module Common
    def initialize(locale)
      @locale = locale
      @spotify_client = Api::SpotifyClient.new
      @youtube_client = Api::YoutubeClient.new
    end

    protected

    attr_reader :locale, :spotify_client, :youtube_client

    def brand_key(brand)
      case brand
      when Api::SPOTIFY
        Streaming::KEY_SPOTIFY
      when Api::APPLE_MUSIC
        Streaming::KEY_APPLE_MUSIC
      when Api::YOUTUBE_MUSIC
        Streaming::KEY_YOUTUBE_MUSIC
      else
        throw ArgumentError.new("Unknown brand: #{brand}")
      end
    end
  end
end
