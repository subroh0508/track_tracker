# frozen_string_literal: true

module Albums
  class CardComponent < ViewComponent::Base
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

    def header_classes
      "line-clamp-2"
    end

    def description_classes
      "line-clamp-2"
    end

    def description
      [year.to_s, artist].reject(&:blank?).join(" • ")
    end
  end
end
