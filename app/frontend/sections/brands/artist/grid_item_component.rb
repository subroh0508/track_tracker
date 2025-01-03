# frozen_string_literal: true

module Brands
  module Artist
    class GridItemComponent < ViewComponent::Base
      attr_reader :register_path, :id, :brand_id, :query,
                  :thumbnail_url, :name

      def initialize(
        register_path: "",
        id: nil,
        brand_id: nil,
        query: "",
        thumbnail_url: "",
        name: ""
      )
        @register_path = register_path
        @id = id
        @brand_id = brand_id
        @query = query
        @thumbnail_url = thumbnail_url
        @name = name
      end

      def classes
        "max-w-sm"
      end
    end
  end
end
