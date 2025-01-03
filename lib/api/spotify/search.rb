# frozen_string_literal: true

require "json"

module Api
  module Spotify
    module Search
      include Api::Spotify::Base
      include Api::Spotify::JsonToHash

      ENDPOINT = "#{Api::Spotify::Base::BASE_ENDPOINT}/search".freeze

      RESULT_KEY_ALBUMS = "albums".freeze
      RESULT_KEY_ARTISTS = "artists".freeze
      RESULT_KEY_TRACKS = "tracks".freeze

      private_constant :ENDPOINT,
                       :RESULT_KEY_ALBUMS,
                       :RESULT_KEY_ARTISTS,
                       :RESULT_KEY_TRACKS

      def search_albums(query, locale)
        return [] if query.blank?

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

        response = send_request { |http|
          http.get(
            "#{ENDPOINT}",
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
