# frozen_string_literal: true

require "json"

module Api
  module Spotify
    module Search
      include Api::Spotify::Base

      ENDPOINT = "#{Api::Spotify::Base::BASE_ENDPOINT}/search".freeze

      private_constant :ENDPOINT

      def search_album(query, locale)
        to_album_hash(search(Api::Spotify::TYPE_ALBUM, query, locale))
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

      def to_album_hash(json)
        json["albums"]["items"].map { |item|
          {
            spotify_id: item["id"],
            title: item["name"],
            thumbnail_url: detect_image(item["images"], 300)&.[]("url"),
            year: item["release_date"].split("-")[0],
            artist: item["artists"].map { |artist| artist["name"] },
          }
        }
      end

      def detect_image(images, size)
        images.detect { |image| image["height"] == size && image["width"] == size }
      end
    end
  end
end
