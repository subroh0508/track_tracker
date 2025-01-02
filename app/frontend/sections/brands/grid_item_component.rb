# frozen_string_literal: true

module Brands
  class GridItemComponent < ViewComponent::Base
    attr_reader :register_path, :id, :spotify_id, :youtube_video_id, :apple_music_id,
                :thumbnail_url, :title, :year, :artist

    def initialize(
      register_path: "",
      id: nil,
      spotify_id: nil,
      youtube_video_id: nil,
      apple_music_id: nil,
      thumbnail_url: "",
      title: "",
      year: 0,
      artist: ""
    )
      @register_path = register_path
      @id = id
      @spotify_id = spotify_id
      @youtube_video_id = youtube_video_id
      @apple_music_id = apple_music_id
      @thumbnail_url = thumbnail_url
      @title = title
      @year = year
      @artist = artist
    end

    def classes
      "max-w-sm"
    end

    def description
      [year.to_s, artist].reject(&:blank?).join(" • ")
    end
  end
end
