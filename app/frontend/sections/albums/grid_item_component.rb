# frozen_string_literal: true

module Albums
  class GridItemComponent < ViewComponent::Base
    attr_reader :thumbnail_url, :title, :year, :artists,
                :spotify_id, :youtube_music_id, :apple_music_id

    def initialize(
      thumbnail_url: "",
      title: "",
      release_date: "",
      artists: "",
      spotify_id: nil,
      youtube_music_id: nil,
      apple_music_id: nil,
      classes: ""
    )
      @thumbnail_url = thumbnail_url
      @title = title
      @year = release_date[0..3]
      @artists = artists
      @spotify_id = spotify_id
      @youtube_music_id = youtube_music_id
      @apple_music_id = apple_music_id
      @classes = classes
    end

    def classes
      [
        "max-w-sm",
        @classes,
      ].join(" ")
    end

    def description
      [
        year.to_s,
        artists.map { |artist| artist[:name] }.join(","),
      ].reject(&:blank?).join(" • ")
    end
  end
end
