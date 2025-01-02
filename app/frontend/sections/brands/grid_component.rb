# frozen_string_literal: true

module Brands
  class GridComponent < ViewComponent::Base
    attr_reader :register_path, :brand, :items

    def initialize(
      register_path: "",
      brand: Api::SPOTIFY,
      items: [],
      classes: ""
    )
      @register_path = register_path
      @brand = brand
      @items = items
      @classes = classes
    end

    def classes
      [
        @classes,
        "grid",
        "grid-cols-auto-fill-180",
        "gap-6",
      ].join(" ")
    end

    def brand_id(item)
      case brand
      when Api::SPOTIFY
        item[:spotify_id]
      when Api::YOUTUBE_MUSIC
        item[:youtube_music_id]
      when Api::APPLE_MUSIC
        item[:apple_music_id]
      else
        throw ArgumentError.new("Unknown brand: #{brand}")
      end
    end
  end
end
