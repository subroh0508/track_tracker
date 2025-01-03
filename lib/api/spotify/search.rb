# frozen_string_literal: true

require "json"

module Api
  module Spotify
    module Search
      include Api::Spotify::Base
      include Api::Spotify::JsonToHash

      RESULT_KEY_ALBUMS = "albums".freeze
      RESULT_KEY_ARTISTS = "artists".freeze
      RESULT_KEY_TRACKS = "streaming_tracks".freeze

      private_constant :RESULT_KEY_ALBUMS,
                       :RESULT_KEY_ARTISTS,
                       :RESULT_KEY_TRACKS

      def search_albums(query, locale)
        search(
          Api::Spotify::TYPE_ALBUM,
          query,
          locale,
          RESULT_KEY_ALBUMS,
        ).map { |item|
          to_album_hash(item)
        }
      end

      def search_artists(query, locale)
        search(
          Api::Spotify::TYPE_ARTIST,
          query,
          locale,
          RESULT_KEY_ARTISTS,
        ).map { |item|
          to_artist_hash(item)
        }
      end

      private

      def search(type, query, locale, result_key)
        return [] if query.blank?

        response = send_request { |http, base_url|
          http.get(
            "#{base_url}/search",
            params: {
              q: query,
              type: type,
              market: locale.upcase,
            },
          )
        }

        JSON.parse(response.body)[result_key]["items"]
      end
    end
  end
end
