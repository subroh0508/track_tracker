# frozen_string_literal: true

module Playlists
  class HeaderComponent < ViewComponent::Base
    attr_reader :id, :title, :active_brand

    def initialize(
      id: nil,
      title: "",
      active_brand: "",
      classes: ""
    )
      @id = id
      @title = title
      @active_brand = active_brand
      @classes = classes
    end

    def classes
      [
        @classes,
        "text-center",
      ].join(" ")
    end

    def text_style
      [
        "text-4xl",
        "font-bold",
        "leading-none",
        "tracking-tight",
        medium_text_style,
        large_text_style,
        light_text_style,
        dark_text_style,
      ].join(" ")
    end

    private

    def medium_text_style
      "md:text-5xl"
    end

    def large_text_style
      "lg:text-6xl"
    end

    def light_text_style
      "text-neutral-900"
    end

    def dark_text_style
      "dark:text-white"
    end
  end
end
