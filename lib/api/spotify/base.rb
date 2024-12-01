# frozen_string_literal: true

require "http"

module Api
  module Spotify
    module Base
      BASE_ENDPOINT = "https://api.spotify.com/v1/".freeze
      TOKEN_URL = "https://accounts.spotify.com/api/token".freeze

      private_constant :TOKEN_URL

      def initialize
        @client_id = ENV["SPOTIFY_CLIENT_ID"]
        @client_secret = ENV["SPOTIFY_CLIENT_SECRET"]
        @logger = Logger.new(STDOUT)
        @http = HTTP.use(logging: { logger: logger })
        @access_token = nil
      end

      protected

      def send_request
        response = yield(http.auth("Bearer #{access_token}"))

        if response.status.unauthorized?
          set_access_token
          yield(http.auth("Bearer #{access_token}"))
        else
          response
        end
      end

      private

      attr_reader :client_id, :client_secret, :logger, :http, :access_token

      def set_access_token
        @access_token = nil

        authorization = Base64.strict_encode64("#{client_id}:#{client_secret}")
        response = http.auth("Basic #{authorization}").
          post(TOKEN_URL, form: { grant_type: "client_credentials" })

        @access_token = JSON.parse(response.body)["access_token"]
      end
    end
  end
end
