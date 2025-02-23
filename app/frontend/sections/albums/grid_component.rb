# frozen_string_literal: true

module Albums
  class GridComponent < ViewComponent::Base
    attr_reader :params, :items, :data

    def initialize(
      items: [],
      data: {},
      classes: ""
    )
      @items = items
      @data = data
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

    def href_select(item)
      url_for(
        controller: :albums,
        action: :show,
        id: item[:id],
      )
    end
  end
end
