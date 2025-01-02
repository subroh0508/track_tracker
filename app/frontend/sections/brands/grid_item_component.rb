# frozen_string_literal: true

module Brands
  class GridItemComponent < ViewComponent::Base
    attr_reader :register_path, :id, :brand_id, :query,
                :thumbnail_url, :title, :year, :artists

    def initialize(
      register_path: "",
      id: nil,
      brand_id: nil,
      query: "",
      thumbnail_url: "",
      title: "",
      year: 0,
      artists: ""
    )
      @register_path = register_path
      @id = id
      @brand_id = brand_id
      @query = query
      @thumbnail_url = thumbnail_url
      @title = title
      @year = year
      @artists = artists
    end

    def classes
      "max-w-sm"
    end

    def description
      [
        year.to_s,
        artists.map { |artist| artist[:name] }.join(","),
      ].reject(&:blank?).join(" • ")
    end
  end
end
