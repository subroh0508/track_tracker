# frozen_string_literal: true

module Albums
  module Spotify
    class PlayerComponent < ViewComponent::Base
      HEADER_HEIGHT = 200
      TRACK_PADDING = 16
      TRACK_ITEM_HEIGHT = 54

      private_constant :HEADER_HEIGHT, :TRACK_PADDING, :TRACK_ITEM_HEIGHT

      def initialize(
        spotify_id: nil,
        tracks: []
      )
        @spotify_id = spotify_id
        @track_count = tracks.size
      end

      def src
        "https://open.spotify.com/embed/album/#{spotify_id}?utm_source=generator"
      end

      def width
        "100%"
      end

      def height
        HEADER_HEIGHT + TRACK_PADDING + (TRACK_ITEM_HEIGHT * track_count)
      end

      def present_spotify_id?
        spotify_id.present?
      end

      private

      attr_reader :spotify_id, :track_count
    end
  end
end
