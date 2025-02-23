# frozen_string_literal: true

module Api
  module Youtube
    module Base
      TYPE_PLAYLIST = "playlist"
      TYPE_CHANNEL = "channel"
      TYPE_VIDEO = "video"

      def initialize(locale)
        @api_key = ENV["YOUTUBE_API_KEY"]
        @logger = Logger.new(STDOUT)
        @http = HTTP.use(logging: { logger: logger })
        @locale = locale
      end

      protected

      def detect_thumbnail(snippet, size)
        snippet["thumbnails"][size]["url"]
      end

      attr_reader :api_key, :logger, :http, :locale
    end
  end
end
