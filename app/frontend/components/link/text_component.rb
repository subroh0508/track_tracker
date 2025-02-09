# frozen_string_literal: true

module Link
  class TextComponent < Link::Component
    attr_reader :active, :shape, :size

    def initialize(
      href: "#",
      data: {},
      classes: ""
    )
      super(
        href: href,
        data: data,
        classes: classes,
      )
    end

    def classes
      [
        @classes,
        "inline-flex",
        "items-center",
        Link::Button::BASE,
        Link::Button::ROUNDED,
        text_style,
      ].join(" ")
    end

    private

    def light_text_style
      %w[
        text-primary-700
        hover:bg-primary-100
      ].join(" ")
    end

    def dark_text_style
      %w[
        dark:text-primary-300
        dark:hover:bg-primary-900
      ].join(" ")
    end
  end
end
