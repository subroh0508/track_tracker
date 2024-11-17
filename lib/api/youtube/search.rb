# frozen_string_literal: true

require "http"
require "json"

module Api
  module Youtube
    class Search < Api::Youtube::Base
      BASE_URL = "https://www.googleapis.com/youtube/v3/search"

      private_constant :BASE_URL

      def search(type, keyword)
        [] if keyword.blank?

        params =
          case type
          when Api::Youtube::TYPE_PLAYLIST
            build_params_for_playlist(keyword)
          when Api::Youtube::TYPE_CHANNEL
            build_params_for_channel(keyword)
          else
            build_params_for_video(keyword)
          end

        response = http.get(BASE_URL, params: params)
        json = JSON.parse(response.body)

        json["items"].map { |item|
          case type
          when Api::Youtube::TYPE_PLAYLIST
            build_response_for_playlist(item)
          when Api::Youtube::TYPE_CHANNEL
            build_response_for_channel(item)
          else
            build_response_for_video(item)
          end
        }
      end

      private

      def build_params_for_playlist(keyword)
        {
          key: api_key,
          q: keyword,
          type: Api::Youtube::TYPE_PLAYLIST,
          maxResults: 10,
          part: "snippet",
        }
      end

      def build_params_for_channel(keyword)
        {
          key: api_key,
          q: keyword,
          type: Api::Youtube::TYPE_CHANNEL,
          maxResults: 10,
          part: "snippet",
        }
      end

      def build_params_for_video(keyword)
        {
          key: api_key,
          q: keyword,
          type: Api::Youtube::TYPE_VIDEO,
          videoCategoryId: "10",
          maxResults: 10,
          part: "snippet",
        }
      end

      def build_response_for_playlist(item)
        {
          id: item["id"]["playlistId"],
          title: item["snippet"]["title"],
          type: Api::Youtube::TYPE_PLAYLIST,
          thumbnail_url: item["snippet"]["thumbnails"]["high"]["url"],
        }
      end

      def build_response_for_channel(item)
        {
          id: item["id"]["channelId"],
          title: item["snippet"]["title"],
          type: Api::Youtube::TYPE_CHANNEL,
          thumbnail_url: item["snippet"]["thumbnails"]["high"]["url"],
        }
      end

      def build_response_for_video(item)
        {
          id: item["id"]["videoId"],
          title: item["snippet"]["title"],
          type: Api::Youtube::TYPE_VIDEO,
          thumbnail_url: item["snippet"]["thumbnails"]["high"]["url"],
        }
      end
    end
  end
end
