# frozen_string_literal: true

require "http"
require "json"

module Api
  module Youtube
    class Playlist
      BASE_URL = "https://www.googleapis.com/youtube/v3/playlists"

      private_constant :BASE_URL

      def initialize
        @api_key = ENV["YOUTUBE_API_KEY"]
        @logger = Logger.new(STDOUT)
        @http = HTTP.use(logging: { logger: logger })
      end

      def fetch(id)
        params = {
          key: api_key,
          id: id,
          part: "snippet,player",
        }

        response = http.get(BASE_URL, params: params)
        json = JSON.parse(response.body)

        json["items"].map { |item|
          {
            id: item["id"],
            title: item["snippet"]["title"],
          }
        }[0]
      end

      private

      attr_reader :api_key, :logger, :http
    end
  end
end
