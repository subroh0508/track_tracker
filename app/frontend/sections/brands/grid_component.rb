# frozen_string_literal: true

module Brands
  class GridComponent < ViewComponent::Base
    attr_reader :items

    def initialize(
      items: [],
      classes: ""
    )
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
