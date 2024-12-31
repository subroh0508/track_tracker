# frozen_string_literal: true

module Albums
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
        "grid-cols-auto-fit-180",
        "gap-6",
      ].join(" ")
    end
  end
end
