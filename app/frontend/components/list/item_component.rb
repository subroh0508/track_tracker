# frozen_string_literal: true

module List
  class ItemComponent < ViewComponent::Base
    attr_reader :header, :description

    def initialize(
      header: "",
      description: ""
    )
      @header = header
      @description = description
    end

    def header_style
      "font-medium #{light_header_style} #{dark_header_style}"
    end

    def description_style
      "text-sm font-normal #{light_description_style} #{dark_description_style}"
    end

    private

    def light_header_style
      "text-neutral-900"
    end

    def dark_header_style
      "dark:text-white"
    end

    def light_description_style
      "text-neutral-700"
    end

    def dark_description_style
      "dark:text-neutral-400"
    end
  end
end
