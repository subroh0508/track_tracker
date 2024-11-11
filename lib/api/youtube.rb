# frozen_string_literal: true

require "http"
require "json"

module Api
  class Youtube
    BASE_URL = "https://www.googleapis.com/youtube/v3/search"

    private_constant :BASE_URL

    def initialize
      @api_key = ENV["YOUTUBE_API_KEY"]
      @logger = Logger.new(STDOUT)
      @http = HTTP.use(logging: { logger: logger })
    end

    def search(keyword)
      [] if keyword.blank?

      params = {
        key: api_key,
        q: keyword,
        type: "video",
        videoCategoryId: "10",
        maxResults: 10,
        part: "snippet",
      }

      response = http.get(BASE_URL, params: params)
      json = JSON.parse(response.body)

      json["items"].map { |item|
        {
          title: item["snippet"]["title"],
          channel_title: item["snippet"]["channelTitle"],
          video_id: item["id"]["videoId"],
          thumbnail_url: item["snippet"]["thumbnails"]["high"]["url"],
        }
      }
    end

    private

    attr_reader :api_key, :logger, :http
  end
end
