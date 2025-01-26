# frozen_string_literal: true

module Albums
  class GridComponent < ViewComponent::Base
    attr_reader :base_url, :params, :items, :data

    def initialize(
      base_url: "",
      items: [],
      data: {},
      classes: ""
    )
      @base_url = base_url
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
      "#{base_url}/#{item[:id]}"
    end
  end
end
