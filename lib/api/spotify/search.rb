# frozen_string_literal: true

require "json"

module Api
  module Spotify
    module Search
      include Api::Spotify::Base

      ENDPOINT = "#{Api::Spotify::Base::BASE_ENDPOINT}/search".freeze

      private_constant :ENDPOINT

      def search_album(query, locale)
        search(Api::Spotify::TYPE_ALBUM, query, locale)
      end

      private

      def search(type, query, locale)
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
        JSON.parse(response.body)
      end
    end
  end
end
