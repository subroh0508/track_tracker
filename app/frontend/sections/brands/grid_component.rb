# frozen_string_literal: true

module Brands
  class GridComponent < ViewComponent::Base
    attr_reader :register_path, :items

    def initialize(
      register_path: "",
      items: [],
      classes: ""
    )
      @register_path = register_path
      @items = items
      @classes = classes
    end

    def classes
      [
        @classes,
        "grid",
        "grid-cols-auto-fill-180",
        "gap-6",
      ].join(" ")
    end
  end
end
