# frozen_string_literal: true

module List
  class ItemComponent < ViewComponent::Base
    attr_reader :header, :description

    def initialize(
      header: "",
      description: ""
    )
      @header = header
      @description = description
    end

    def header_style
      [
        "font-medium",
        "line-clamp-1",
        light_header_style,
        dark_header_style,
      ].join(" ")
    end

    def description_style
      [
        "text-sm",
        "font-normal",
        "line-clamp-1",
        light_description_style,
        dark_description_style,
      ].join(" ")
    end

    private

    def light_header_style
      "text-neutral-900"
    end

    def dark_header_style
      "dark:text-white"
    end

    def light_description_style
      "text-neutral-700"
    end

    def dark_description_style
      "dark:text-neutral-400"
    end
  end
end
