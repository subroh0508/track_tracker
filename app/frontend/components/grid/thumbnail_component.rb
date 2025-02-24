# frozen_string_literal: true

module Grid
  class ThumbnailComponent < ViewComponent::Base
    attr_reader :src, :shape

    def initialize(
      src: "",
      shape: Grid::THUMBNAIL_ROUNDED
    )
      @src = src
      @shape = shape
    end

    def classes
      [
        shape,
        "object-cover",
        "aspect-square",
        "w-full",
      ].join(" ")
    end
  end
end
