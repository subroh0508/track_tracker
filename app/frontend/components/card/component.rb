# frozen_string_literal: true

module Card
  class Component < ViewComponent::Base
    renders_one :thumbnail
    renders_one :header, Card::HeaderComponent
    renders_one :description

    def initialize(classes: "")
      @classes = classes
    end

    def classes
      [
        @classes,
        padding,
        background,
        border,
      ].join(" ")
    end

    private

    def padding
      thumbnail? ? "" : "p-6"
    end

    def background
      [
        "rounded-lg",
        "shadow",
        light_background,
        dark_background,
      ].join(" ")
    end

    def border
      [
        "border",
        light_border,
        dark_border,
      ].join(" ")
    end

    def light_background
      "bg-white"
    end

    def dark_background
      "dark:bg-neutral-800"
    end

    def light_border
      "border-neutral-200"
    end

    def dark_border
      "dark:border-neutral-700"
    end
  end
end
