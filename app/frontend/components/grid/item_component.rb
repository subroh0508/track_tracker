# frozen_string_literal: true

module Grid
  class ItemComponent < ViewComponent::Base
    attr_reader :thumbnail_url, :thumbnail_shape, :header, :description, :classes

    def initialize(
      thumbnail_url: "",
      thumbnail_shape: Grid::THUMBNAIL_ROUNDED,
      header: "",
      description: "",
      classes: ""
    )
      @thumbnail_url = thumbnail_url
      @thumbnail_shape = thumbnail_shape
      @header = header
      @description = description
      @classes = classes
    end

    def thumbnail_classes
      [
        thumbnail_shape,
        "object-cover",
        "aspect-square",
        "w-full",
      ].join(" ")
    end

    def header_classes
      "my-2 #{header_text_style}"
    end

    def description_classes
      "mb-2 #{description_text_style}"
    end

    private

    def header_text_style
      [
        "text-base",
        "font-medium",
        "leading-tight",
        "line-clamp-2",
        header_light_text_style,
        header_dark_text_style,
      ].join(" ")
    end

    def header_light_text_style
      "text-neutral-900"
    end

    def header_dark_text_style
      "dark:text-white"
    end

    def description_text_style
      [
        "text-sm",
        "font-normal",
        "line-clamp-2",
        description_light_text_style,
        description_dark_text_style,
      ].join(" ")
    end

    def description_light_text_style
      "text-neutral-700"
    end

    def description_dark_text_style
      "dark:text-neutral-400"
    end
  end
end
