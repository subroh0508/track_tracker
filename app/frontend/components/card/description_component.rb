# frozen_string_literal: true

module Card
  class DescriptionComponent < ViewComponent::Base
    def classes
      "mb-3 #{text_style}"
    end

    private

    def text_style
      [
        "font-normal",
        light_text_style,
        dark_text_style,
      ].join(" ")
    end

    def light_text_style
      "text-neutral-700"
    end

    def dark_text_style
      "dark:text-neutral-400"
    end
  end
end
