# frozen_string_literal: true

module List
  class Component < ViewComponent::Base
    renders_many :items

    attr_reader :index_range, :item_height, :classes

    def initialize(
      index_range: nil,
      classes: "h-12"
    )
      @index_range = index_range
      @item_height = item_height
      @classes = classes
    end

    def index_classes
      [
        "flex",
        "justify-end",
        "items-center",
        "mb-4",
        light_index_style,
        dark_index_style,
        @classes,
      ].join(" ")
    end

    def item_classes
      [
        "px-4",
        "mb-4",
        @classes,
      ].join(" ")
    end

    private

    def light_index_style
      "text-neutral-700"
    end

    def dark_index_style
      "dark:text-neutral-400"
    end
  end
end
