# frozen_string_literal: true

module Api
  module Spotify
    module JsonToHash
      def to_album_hash(json)
        hash = {
          spotify_id: json["id"],
          title: json["name"],
          thumbnail_url: detect_image(
            json["images"],
            300,
          )&.[]("url"),
          year: json["release_date"][0..3],
          artists: json["artists"].map { |artist| to_artist_hash(artist) },
        }

        if json.key?("streaming_tracks")
          hash.merge(
            tracks: json["streaming_tracks"]["items"].map { |track|
              to_track_hash(track)
            },
          )
        else
          hash
        end
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
        hash = {
          spotify_id: json["id"],
          name: json["name"],
        }

        if json.key?("images")
          hash.merge(
            thumbnail_url: detect_image(
              json["images"],
              300,
            )&.[]("url"),
          )
        else
          hash
        end
      end

      private

      def detect_image(images, size)
        images.min_by { |image| (image["height"] - size).abs + (image["width"] - size).abs }
      end
    end
  end
end
