# frozen_string_literal: true

require "http"

module Api
  module Spotify
    module Base
      BASE_ENDPOINT = "https://api.spotify.com/v1".freeze
      TOKEN_URL = "https://accounts.spotify.com/api/token".freeze

      private_constant :TOKEN_URL

      @@spotify_access_token = nil

      def initialize
        @client_id = ENV["SPOTIFY_CLIENT_ID"]
        @client_secret = ENV["SPOTIFY_CLIENT_SECRET"]
        @logger = Logger.new(STDOUT)
        @http = HTTP.use(logging: { logger: logger })
      end

      protected

      def send_request
        if access_token.nil?
          reset_access_token
        end

        response = yield(http.auth("Bearer #{access_token}"))

        if response.status.unauthorized?
          reset_access_token
          yield(http.auth("Bearer #{access_token}"))
        else
          response
        end
      end

      def to_album_hash(json)
        result = {
          spotify_id: json["id"],
          title: json["name"],
          thumbnail_url: detect_image(json["images"], 300)&.[]("url"),
          year: json["release_date"][0..3],
          artists: json["artists"].map { |artist| to_artist_hash(artist) },
          tracks: json["tracks"]&.[]("items")&.map { |track| to_track_hash(track) },
        }

        if json.key?("tracks")
          result.merge(
            tracks: json["tracks"]["items"].map { |track|
              to_track_hash(track)
            },
          )
        else
          result
        end
      end

      private

      attr_reader :client_id, :client_secret, :logger, :http

      def reset_access_token
        @@spotify_access_token = nil

        authorization = Base64.strict_encode64("#{client_id}:#{client_secret}")
        response = http.auth("Basic #{authorization}").
          post(TOKEN_URL, form: { grant_type: "client_credentials" })

        @@spotify_access_token = JSON.parse(response.body)["access_token"]
      end

      def access_token
        @@spotify_access_token
      end

      def to_track_hash(json)
        {
          spotify_id: json["id"],
          title: json["name"],
          track_number: json["track_number"],
          artists: json["artists"].map { |artist| to_artist_hash(artist) },
        }
      end

      def to_artist_hash(json)
        {
          spotify_id: json["id"],
          name: json["name"],
        }
      end

      def detect_image(images, size)
        images.detect { |image| image["height"] == size && image["width"] == size }
      end
    end
  end
end
