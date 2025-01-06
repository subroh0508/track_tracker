# frozen_string_literal: true

module StreamingTracks
  module Album
    class ListItemComponent < ViewComponent::Base
      attr_reader :thumbnail_url, :title, :year, :artists,
                  :spotify_id, :youtube_music_id, :apple_music_id

      def initialize(
        thumbnail_url: "",
        title: "",
        year: 0,
        artists: [],
        spotify_id: nil,
        youtube_music_id: nil,
        apple_music_id: nil,
        classes: ""
      )
        @thumbnail_url = thumbnail_url
        @title = title
        @year = year
        @artists = artists
        @spotify_id = spotify_id
        @youtube_music_id = youtube_music_id
        @apple_music_id = apple_music_id
        @classes = classes
      end

      def classes
        [
          "flex",
          "items-center",
          @classes,
        ].join(" ")
      end

      def thumbnail_classes
        "h-20 w-20 me-3 object-cover rounded-md"
      end

      def description
        [
          year.to_s,
          artists.map { |artist| artist[:name] }.join(","),
        ].reject(&:blank?).join(" • ")
      end
    end
  end
end
