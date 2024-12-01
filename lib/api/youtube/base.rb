# frozen_string_literal: true

module Api
  module Youtube
    module Base
      TYPE_PLAYLIST = "playlist"
      TYPE_CHANNEL = "channel"
      TYPE_VIDEO = "video"

      def initialize
        @api_key = ENV["YOUTUBE_API_KEY"]
        @logger = Logger.new(STDOUT)
        @http = HTTP.use(logging: { logger: logger })
      end

      protected

      attr_reader :api_key, :logger, :http
    end
  end
end
