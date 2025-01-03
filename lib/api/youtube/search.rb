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
        search(Api::Youtube::Base::TYPE_PLAYLIST, query)
      end

      def search_channels(query)
        search(Api::Youtube::Base::TYPE_CHANNEL, query)
      end

      private

      def search(type, query)
        return [] if query.blank?

        params =
          case type
          when Api::Youtube::Base::TYPE_PLAYLIST
            build_params_for_playlist(query)
          when Api::Youtube::Base::TYPE_CHANNEL
            build_params_for_channel(query)
          else
            build_params_for_video(query)
          end

        response = http.get(BASE_URL, params: params)
        json = JSON.parse(response.body)

        json["items"].map { |item|
          case type
          when Api::Youtube::Base::TYPE_PLAYLIST
            build_response_for_playlist(item)
          when Api::Youtube::Base::TYPE_CHANNEL
            build_response_for_channel(item)
          else
            build_response_for_video(item)
          end
        }
      end

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

      def build_params_for_video(query)
        {
          key: api_key,
          q: query,
          type: Api::Youtube::Base::TYPE_VIDEO,
          videoCategoryId: "10",
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

      def build_response_for_video(item)
        {
          youtube_music_id: item["id"]["videoId"],
          title: item["snippet"]["title"],
          thumbnail_url: detect_thumbnail(item["snippet"], "high"),
        }
      end
    end
  end
end
