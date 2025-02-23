# frozen_string_literal: true

module StreamingTracks
  module Common
    def initialize(locale)
      @locale = locale
      @spotify_client = Api::SpotifyClient.new(locale)
      @youtube_client = Api::YoutubeClient.new(locale)
    end

    protected

    attr_reader :locale, :spotify_client, :youtube_client
  end
end
