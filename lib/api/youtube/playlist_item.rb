# frozen_string_literal: true

require "http"
require "json"

module Api
  module Youtube
    module PlaylistItem
      include Api::Youtube::Base

      BASE_URL = "https://www.googleapis.com/youtube/v3/playlistItems"

      private_constant :BASE_URL

      def fetch_playlist_items(playlist_id, count)
        params = {
          key: api_key,
          playlistId: playlist_id,
          part: "snippet",
          maxResults: count,
        }

        response = http.get(BASE_URL, params: params)
        json = JSON.parse(response.body)

        json["items"].map { |item|
          {
            youtube_music_id: item["snippet"]["resourceId"]["videoId"],
            title: item["snippet"]["title"],
            track_number: item["snippet"]["position"],
            thumbnail_url: item["snippet"]["thumbnails"]["default"]["url"],
            video_owner_channel_id: item["snippet"]["videoOwnerChannelId"],
          }
        }
      end
    end
  end
end
