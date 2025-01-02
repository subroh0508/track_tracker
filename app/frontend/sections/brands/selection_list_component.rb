# frozen_string_literal: true

module Brands
  class SelectionListComponent < ViewComponent::Base
    attr_reader :items

    def initialize(items: [])
      @items = items
    end

    def header_text
      "選択中: #{items.size}件"
    end

    def header_classes
      "mb-3 text-lg font-bold #{light_header_style} #{dark_header_style}"
    end

    def thumbnail_classes
      "h-20 w-20 me-3 object-cover rounded-md"
    end

    private

    def light_header_style
      "text-neutral-900"
    end

    def dark_header_style
      "dark:text-white"
    end
  end
end
