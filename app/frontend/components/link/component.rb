# frozen_string_literal: true

module Link
  class Component < ViewComponent::Base
    attr_reader :href, :data

    def initialize(
      href: "#",
      data: {},
      classes: ""
    )
      @href = href
      @data = data
      @classes = classes
    end

    def classes
      [
        @classes,
        "inline-flex",
        "items-center",
        text_style,
      ].join(" ")
    end

    protected

    def text_style
      [
        light_text_style,
        dark_text_style,
      ].join(" ")
    end

    def light_text_style
      ""
    end

    def dark_text_style
      ""
    end
  end
end
