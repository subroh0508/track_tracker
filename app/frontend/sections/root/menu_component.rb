# frozen_string_literal: true

module Root
  class MenuComponent < ViewComponent::Base
    attr_reader :menus

    def initialize(menus: [])
      @menus = menus
    end

    def classes
      [
        "flex",
        "flex-col",
        "mt-4",
        "font-medium",
        default_style,
        medium_style,
      ].join(" ")
    end

    def menu_classes(is_active)
      [
        "block",
        "rounded",
        "py-2",
        "px-4",
        is_active ? active_link_style : link_style,
      ].join(" ")
    end

    private

    def default_style
      %w[
        p-4
        border
        rounded-lg
        bg-neutral-50
        dark:bg-neutral-800
        border-neutral-100
        dark:border-neutral-700
      ].join(" ")
    end

    def medium_style
      %w[
        md:p-0
        md:space-x-8
        md:flex-row
        md:mt-0
        md:border-0
        md:bg-white
        md:dark:bg-neutral-900
      ].join(" ")
    end

    def link_style
      [
        "text-neutral-900",
        "dark:text-white",
        default_link_style,
        medium_link_style,
      ].join(" ")
    end

    def default_link_style
      %w[
        hover:bg-neutral-100
        dark:hover:bg-neutral-600
        dark:hover:text-white
        dark:border-neutral-700
      ].join(" ")
    end

    def medium_link_style
      %w[
        md:p-0
        md:hover:bg-transparent
        md:hover:text-primary-300
        md:dark:hover:text-primary-500
        md:dark:hover:bg-transparent
      ].join(" ")
    end

    def active_link_style
      [
        active_default_link_style,
        active_medium_link_style,
      ].join(" ")
    end

    def active_default_link_style
      %w[
        text-white
        bg-primary-700
      ].join(" ")
    end

    def active_medium_link_style
      %w[
        md:p-0
        md:text-primary-700
        md:bg-transparent
        md:dark:text-primary-300
      ].join(" ")
    end
  end
end
