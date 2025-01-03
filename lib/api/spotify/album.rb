# frozen_string_literal: true

require "json"

module Api
  module Spotify
    module Album
      include Api::Spotify::Base
      include Api::Spotify::JsonToHash

      def fetch_album(id, locale)
        response = send_request { |http, base_url|
          http.get(
            "#{base_url}/albums/#{id}",
            params: {
              market: locale.upcase,
            },
          )
        }
        to_album_hash(JSON.parse(response.body))
      end

      def fetch_albums_from_artist(artist_id, locale)
        response = send_request { |http, base_url|
          http.get(
            "#{base_url}/artists/#{artist_id}/albums",
            params: {
              include_groups: "album,single,appears_on,compilation",
              market: locale.upcase,
            },
          )
        }

        JSON.parse(response.body)["items"].map { |item|
          to_album_hash(item)
        }
      end
    end
  end
end
