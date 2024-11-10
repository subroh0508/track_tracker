# frozen_string_literal: true

module Card
  class HeaderComponent < ViewComponent::Base
    def classes
      "mb-2 #{text_style}"
    end

    private

    def text_style
      [
        "text-2xl",
        "font-bold",
        "tracking-tight",
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
