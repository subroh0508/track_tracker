# frozen_string_literal: true

require "http"
require "json"

module Api
  module Youtube
    module Search
      include Api::Youtube::Base

      BASE_URL = "https://www.googleapis.com/youtube/v3/search"

      private_constant :BASE_URL

      def search_playlists(query)
        return [] if query.blank?

        response = http.get(
          BASE_URL,
          params: build_params_for_playlist(query),
        )
        json = JSON.parse(response.body)

        json["items"].map { |item|
          build_response_for_playlist(item)
        }
      end

      def search_channels(query)
        return [] if query.blank?

        response = http.get(
          BASE_URL,
          params: build_params_for_channel(query),
        )
        json = JSON.parse(response.body)

        json["items"].map { |item|
          build_response_for_channel(item)
        }
      end

      private

      def build_params_for_playlist(query)
        {
          key: api_key,
          q: query,
          type: Api::Youtube::Base::TYPE_PLAYLIST,
          maxResults: 10,
          part: "snippet",
        }
      end

      def build_params_for_channel(query)
        {
          key: api_key,
          q: query,
          type: Api::Youtube::Base::TYPE_CHANNEL,
          maxResults: 10,
          part: "snippet",
        }
      end

      def build_response_for_playlist(item)
        {
          youtube_music_id: item["id"]["playlistId"],
          title: item["snippet"]["title"],
          thumbnail_url: detect_thumbnail(item["snippet"], "high"),
        }
      end

      def build_response_for_channel(item)
        {
          youtube_music_id: item["id"]["channelId"],
          title: item["snippet"]["title"],
          thumbnail_url: detect_thumbnail(item["snippet"], "high"),
        }
      end
    end
  end
end
