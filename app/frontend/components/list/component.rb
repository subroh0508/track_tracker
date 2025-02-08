# frozen_string_literal: true

module List
  class Component < ViewComponent::Base
    renders_many :items
    renders_many :leadings
    renders_many :trailings

    attr_reader :classes

    def initialize(
      item_classes: "h-12 mb-4",
      leading_classes: "h-12 mb-4",
      trailing_classes: "h-12 mb-4",
      classes: ""
    )
      @item_classes = item_classes
      @leading_classes = leading_classes
      @trailing_classes = trailing_classes
      @classes = classes
    end

    def leading_classes
      [
        "flex",
        "justify-end",
        "items-center",
        light_index_style,
        dark_index_style,
        @leading_classes,
      ].join(" ")
    end

    def item_classes
      [
        "px-4",
        @item_classes,
      ].join(" ")
    end

    def trailing_classes
      [
        "flex",
        "justify-end",
        "items-center",
        light_index_style,
        dark_index_style,
        @trailing_classes,
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
