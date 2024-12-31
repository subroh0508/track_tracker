# frozen_string_literal: true

module Card
  class SmallHeaderComponent < ViewComponent::Base
    def initialize(classes: "")
      @classes = classes
    end

    def classes
      [
        @classes,
        "mb-2",
        text_style,
      ].join(" ")
    end

    private

    def text_style
      [
        "text-lg",
        "font-medium",
        "leading-tight",
        light_text_style,
        dark_text_style,
      ].join(" ")
    end

    def light_text_style
      "text-neutral-900"
    end

    def dark_text_style
      "dark:text-white"
    end
  end
end
