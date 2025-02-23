# frozen_string_literal: true

require "http"

module Api
  module Spotify
    module Base
      BASE_ENDPOINT = "https://api.spotify.com/v1".freeze
      TOKEN_URL = "https://accounts.spotify.com/api/token".freeze

      private_constant :BASE_ENDPOINT, :TOKEN_URL

      @@spotify_access_token = nil

      def initialize(locale)
        @client_id = ENV["SPOTIFY_CLIENT_ID"]
        @client_secret = ENV["SPOTIFY_CLIENT_SECRET"]
        @logger = Logger.new(STDOUT)
        @http = HTTP.use(logging: { logger: logger })
        @locale = locale
      end

      protected

      def send_request
        if access_token.nil?
          reset_access_token
        end

        response = yield(
          http.auth("Bearer #{access_token}").
            headers("Accept-Language" => locale),
          BASE_ENDPOINT
        )

        if response.status.unauthorized?
          reset_access_token
          yield(
            http.auth("Bearer #{access_token}").
              headers("Accept-Language" => locale),
            BASE_ENDPOINT
          )
        else
          response
        end
      end

      private

      attr_reader :client_id, :client_secret, :logger, :http, :locale

      def reset_access_token
        @@spotify_access_token = nil

        response = http.headers("Content-Type" => "application/x-www-form-urlencoded").
          post(
            TOKEN_URL,
            form: {
              grant_type: "client_credentials",
              client_id: client_id,
              client_secret: client_secret,
            },
          )

        @@spotify_access_token = JSON.parse(response.body)["access_token"]
      end

      def access_token
        @@spotify_access_token
      end
    end
  end
end
