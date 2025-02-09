# frozen_string_literal: true

module Dropdown
  class ListComponent < ViewComponent::Base
    attr_reader :active, :href, :data

    def initialize(
      active: false,
      href: "#",
      data: {},
      classes: ""
    )
      @active = active
      @href = href
      @data = data
      @classes = classes
    end

    def classes
      [
        "w-full",
        "px-4",
        "py-2",
        light_text_style,
        dark_text_style,
      ].join(" ")
    end

    private

    def light_text_style
      [
        active ? "text-primary-700" : "text-neutral-500",
        "bg-white",
        "hover:bg-neutral-200",
      ].join(" ")
    end

    def dark_text_style
      [
        active ? "dark:text-primary-300" : "dark:text-neutral-400",
        "dark:bg-neutral-700",
        "dark:hover:bg-neutral-600",
      ].join(" ")
    end
  end
end
