# frozen_string_literal: true

require "http"
require "json"

module Api
  module Youtube
    module Playlist
      include Api::Youtube::Base

      BASE_URL = "https://www.googleapis.com/youtube/v3/playlists"

      private_constant :BASE_URL

      def fetch_playlists(id)
        return [] if id.blank?

        params = {
          key: api_key,
          id: id,
          part: "snippet,localizations,contentDetails",
        }.compact

        response = http.get(BASE_URL, params: params)
        json = JSON.parse(response.body)

        json["items"].map { |item|
          {
            youtube_music_id: item["id"],
            title: localized_title(item),
            thumbnail_url: detect_thumbnail(item["snippet"], "standard"),
            year: item["snippet"]["publishedAt"][0..3],
            artists: [{
              youtube_music_id: item["snippet"]["channelId"],
              name: item["snippet"]["channelTitle"],
            }],
            total_tracks: item["contentDetails"]["itemCount"],
          }
        }
      end

      private

      def localized_title(item)
        value = item.dig("localizations", locale)

        if value.present?
          value["title"]
        else
          item["snippet"]["title"]
        end
      end
    end
  end
end
