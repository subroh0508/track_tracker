# frozen_string_literal: true

module Dropdown
  class Component < ViewComponent::Base
    renders_one :button
    renders_many :items

    attr_reader :button_classes, :classes

    def initialize(
      anchor: Dropdown::Anchor::LEFT_BOTTOM,
      button_classes: "",
      dropdown_classes: "",
      classes: ""
    )
      @anchor = anchor
      @button_classes = button_classes
      @dropdown_classes = dropdown_classes
      @classes = classes
    end

    def dropdown_classes
      [
        @anchor,
        "mt-2",
        "w-56",
        "rounded-md",
        "shadow-lg",
        "bg-white",
        "dark:bg-neutral-700",
        "shadow-sm",
        "ring-1",
        "ring-black",
        "ring-opacity-5",
        "z-50",
        @dropdown_classes,
      ].join(" ")
    end
  end
end
