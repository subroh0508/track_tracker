# frozen_string_literal: true

module Card
  class Component < ViewComponent::Base
    renders_one :thumbnail
    renders_one :header
    renders_one :description

    def initialize(classes: "")
      @classes = classes
    end

    def classes
      [
        @classes,
        padding_style,
        background_style,
        border_style,
      ].join(" ")
    end

    private

    def padding_style
      thumbnail? ? "" : "p-6"
    end

    def background_style
      [
        "rounded-lg",
        light_background_style,
        dark_background_style,
      ].join(" ")
    end

    def border_style
      [
        "border",
        light_border_style,
        dark_border_style,
      ].join(" ")
    end

    def light_background_style
      "bg-white"
    end

    def dark_background_style
      "dark:bg-neutral-800"
    end

    def light_border_style
      "border-neutral-200"
    end

    def dark_border_style
      "dark:border-neutral-700"
    end
  end
end
