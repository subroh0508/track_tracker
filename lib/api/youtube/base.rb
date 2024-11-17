# frozen_string_literal: true

module Api
  module Youtube
    class Base
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
