# frozen_string_literal: true

require "json"

module Api
  module Spotify
    module Artist
      include Api::Spotify::Base
      include Api::Spotify::JsonToHash

      def fetch_artist(id, locale)
        return nil if id.blank?

        response = send_request { |http, base_url|
          http.get(
            "#{base_url}/artists/#{id}",
            params: {
              market: locale.upcase,
            },
          )
        }
        to_artist_hash(JSON.parse(response.body))
      end
    end
  end
end
