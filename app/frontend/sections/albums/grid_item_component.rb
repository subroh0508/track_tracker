# frozen_string_literal: true

module Albums
  class GridItemComponent < ViewComponent::Base
    attr_reader :thumbnail_url, :title, :year, :artist

    def initialize(
      thumbnail_url: "",
      title: "",
      year: 0,
      artist: ""
    )
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
