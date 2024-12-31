# frozen_string_literal: true

module Grid
  class ItemComponent < ViewComponent::Base
    attr_reader :thumbnail, :header, :description, :classes

    def initialize(
      thumbnail: "",
      header: "",
      description: "",
      classes: ""
    )
      @thumbnail = thumbnail
      @header = header
      @description = description
      @classes = classes
    end

    def thumbnail_classes
      "rounded-lg"
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
