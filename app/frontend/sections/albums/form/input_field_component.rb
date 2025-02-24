# frozen_string_literal: true

module Albums
  module Form
    class InputFieldComponent < ViewComponent::Base
      attr_reader :url, :classes

      def initialize(
        album: {},
        url: "#",
        classes: ""
      )
        @album = album
        @url = url
        @classes = classes
      end

      def sections
        [
          [
            album_title,
            album_id,
            spotify_id,
            apple_music_id,
            youtube_music_id,
          ],
        ] + album[:artists].map.with_index(1) { |artist, i|
          [
            artist_name(artist, i),
            artist_id(i),
            artist_spotify_id(artist, i),
            artist_apple_music_id(artist, i),
            artist_youtube_music_id(artist, i),
          ]
        }
      end

      def textarea?(item)
        item.type == "textarea"
      end

      def id?(item)
        [
          Streaming::KEY_SPOTIFY,
          Streaming::KEY_APPLE_MUSIC,
          Streaming::KEY_YOUTUBE_MUSIC,
        ].any? { |key| item.id&.include?(key.to_s) }
      end

      private

      attr_reader :album

      def album_title
        InputField::Item.new(
          id: "title",
          name: "album[title]",
          label: t("albums.label.album_title"),
          type: "textarea",
          icon_class: Icon::CompactDisc,
          placeholder: t("albums.label.album_title"),
          rows: 3,
          value: album[:title],
          required: true,
        )
      end

      def album_id
        InputField::Item.new(
          label: t("albums.label.album_id"),
        )
      end

      def spotify_id
        InputField::Item.new(
          id: "spotify_id",
          name: "album[spotify_id]",
          type: "text",
          icon_class: Icon::Spotify,
          placeholder: t("albums.placeholder.spotify_id"),
          value: album[:spotify_id],
          required: true,
        )
      end

      def apple_music_id
        InputField::Item.new(
          id: "apple_music_id",
          name: "album[apple_music_id]",
          type: "text",
          icon_class: Icon::AppleMusic,
          placeholder: t("albums.placeholder.apple_music_id"),
          value: album[:apple_music_id],
          required: true,
        )
      end

      def youtube_music_id
        InputField::Item.new(
          id: "youtube_music_id",
          name: "album[youtube_music_id]",
          type: "text",
          icon_class: Icon::YoutubeMusic,
          placeholder: t("albums.placeholder.youtube_music_id"),
          value: album[:youtube_music_id],
          required: true,
        )
      end

      def artist_name(artist, index)
        InputField::Item.new(
          id: "artist_name_#{index}",
          name: "album[artists][][name]",
          label: t("albums.label.artist_name", index: index),
          type: "textarea",
          icon_class: Icon::User,
          placeholder: t("albums.placeholder.artist_name"),
          rows: 1,
          value: artist[:name],
          required: true,
        )
      end

      def artist_id(index)
        InputField::Item.new(
          label: t("albums.label.artist_id", index: index),
        )
      end

      def artist_spotify_id(artist, index)
        InputField::Item.new(
          id: "spotify_id_#{index}",
          name: "album[artists][][spotify_id]",
          type: "text",
          icon_class: Icon::Spotify,
          placeholder: t("albums.placeholder.spotify_id"),
          value: artist[:spotify_id],
          required: true,
        )
      end

      def artist_apple_music_id(artist, index)
        InputField::Item.new(
          id: "apple_music_id_#{index}",
          name: "album[artists][][apple_music_id]",
          type: "text",
          icon_class: Icon::AppleMusic,
          placeholder: t("albums.placeholder.apple_music_id"),
          value: artist[:apple_music_id],
          required: true,
        )
      end

      def artist_youtube_music_id(artist, index)
        InputField::Item.new(
          id: "youtube_music_id_#{index}",
          name: "album[artists][][youtube_music_id]",
          type: "text",
          icon_class: Icon::YoutubeMusic,
          placeholder: t("albums.placeholder.youtube_music_id"),
          value: artist[:youtube_music_id],
          required: true,
        )
      end
    end
  end
end
