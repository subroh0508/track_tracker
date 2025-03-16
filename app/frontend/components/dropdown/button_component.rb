# frozen_string_literal: true

module Dropdown
  class ButtonComponent < Button::Component
    def classes
      [
        "w-full",
        "px-4",
        "py-2",
        "inline-flex",
        "items-center",
        light_text_style,
        dark_text_style,
      ].join(" ")
    end

    private

    def light_text_style
      %w[
        text-neutral-500
        bg-white
        hover:bg-neutral-200
      ].join(" ")
    end

    def dark_text_style
      %w[
        dark:text-neutral-400
        dark:bg-neutral-700
        dark:hover:bg-neutral-600
      ].join(" ")
    end
  end
end
