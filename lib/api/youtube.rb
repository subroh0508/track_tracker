# frozen_string_literal: true

require "http"
require "json"

module Api
  class Youtube
    SEARCH_API = "https://www.googleapis.com/youtube/v3/search"

    TYPE_PLAYLIST = "playlist"
    TYPE_CHANNEL = "channel"
    TYPE_VIDEO = "video"

    private_constant :SEARCH_API

    def initialize
      @api_key = ENV["YOUTUBE_API_KEY"]
      @logger = Logger.new(STDOUT)
      @http = HTTP.use(logging: { logger: logger })
    end

    def search(type, keyword)
      [] if keyword.blank?

      params = {
        key: api_key,
        q: keyword,
        type: type,
        videoCategoryId: "10",
        maxResults: 10,
        part: "snippet",
      }

      response = http.get(SEARCH_API, params: params)
      json = JSON.parse(response.body)

      json["items"].map { |item|
        case type
        when TYPE_PLAYLIST
          build_response_for_playlist(item)
        when TYPE_CHANNEL
          build_response_for_channel(item)
        else
          build_response_for_video(item)
        end
      }
    end

    private

    attr_reader :api_key, :logger, :http

    def build_response_for_playlist(item)
      {
        id: item["id"]["playlistId"],
        title: item["snippet"]["title"],
        type: TYPE_PLAYLIST,
        thumbnail_url: item["snippet"]["thumbnails"]["high"]["url"],
      }
    end

    def build_response_for_channel(item)
      {
        id: item["id"]["channelId"],
        title: item["snippet"]["title"],
        type: TYPE_CHANNEL,
        thumbnail_url: item["snippet"]["thumbnails"]["high"]["url"],
      }
    end

    def build_response_for_video(item)
      {
        id: item["id"]["videoId"],
        title: item["snippet"]["title"],
        type: TYPE_VIDEO,
        thumbnail_url: item["snippet"]["thumbnails"]["high"]["url"],
      }
    end
  end
end
