# frozen_string_literal: true

require "http"
require "json"

module Api
  module Youtube
    module Channel
      include Api::Youtube::Base

      BASE_URL = "https://www.googleapis.com/youtube/v3/channels"

      private_constant :BASE_URL

      def fetch_channels(id)
        return [] if id.blank?

        params = {
          key: api_key,
          id: id,
          part: "snippet,localizations",
        }

        response = http.get(BASE_URL, params: params)
        json = JSON.parse(response.body)

        json["items"].map { |item|
          {
            youtube_music_id: item["id"],
            name: localized_title(item, "ja"),
            thumbnail_url: detect_thumbnail(item["snippet"], "high"),
          }
        }
      end

      private

      def localized_title(item, locale)
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
