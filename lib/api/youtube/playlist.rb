# frozen_string_literal: true

require "http"
require "json"

module Api
  module Youtube
    class Playlist < Api::Youtube::Base
      BASE_URL = "https://www.googleapis.com/youtube/v3/playlists"

      private_constant :BASE_URL

      def fetch(id)
        params = {
          key: api_key,
          id: id,
          part: "snippet,localizations,contentDetails",
        }

        response = http.get(BASE_URL, params: params)
        json = JSON.parse(response.body)

        json["items"].map { |item|
          {
            id: item["id"],
            title: localized_title(item, "ja"),
            item_count: item["contentDetails"]["itemCount"],
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
