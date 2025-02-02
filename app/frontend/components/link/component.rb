# frozen_string_literal: true

module Link
  class Component < ViewComponent::Base
    attr_reader :href, :icon, :data

    def initialize(
      href: "#",
      icon: nil,
      data: {},
      classes: ""
    )
      @href = href
      @icon = icon
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

    def icon?
      icon.present?
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
