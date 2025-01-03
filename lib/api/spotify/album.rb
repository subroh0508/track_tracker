# frozen_string_literal: true

require "json"

module Api
  module Spotify
    module Album
      include Api::Spotify::Base
      include Api::Spotify::JsonToHash

      ENDPOINT = "#{Api::Spotify::Base::BASE_ENDPOINT}/albums".freeze

      private_constant :ENDPOINT

      def fetch_album(id, locale)
        response = send_request { |http|
          http.get("#{ENDPOINT}/#{id}", params: { market: locale.upcase })
        }
        to_album_hash(JSON.parse(response.body))
      end
    end
  end
end
