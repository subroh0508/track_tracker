# frozen_string_literal: true

module Albums
  class GridItemComponent < ViewComponent::Base
    attr_reader :thumbnail_url, :title, :year, :artists

    def initialize(
      thumbnail_url: "",
      title: "",
      release_date: "",
      artists: "",
      classes: ""
    )
      @thumbnail_url = thumbnail_url
      @title = title
      @year = release_date[0..3]
      @artists = artists
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
