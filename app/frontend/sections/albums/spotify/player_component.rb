# frozen_string_literal: true

module Albums
  module Spotify
    class PlayerComponent < ViewComponent::Base
      NORMAL_HEIGHT = 352
      COMPACT_HEIGHT = 152

      private_constant :NORMAL_HEIGHT, :COMPACT_HEIGHT

      def initialize(spotify_id: "")
        @spotify_id = spotify_id
      end

      def src
        "https://open.spotify.com/embed/album/#{spotify_id}?utm_source=generator"
      end

      def width
        "100%"
      end

      def height
        NORMAL_HEIGHT
      end

      private

      attr_reader :spotify_id
    end
  end
end
