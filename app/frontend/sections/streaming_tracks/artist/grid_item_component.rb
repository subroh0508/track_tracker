# frozen_string_literal: true

module StreamingTracks
  module Artist
    class GridItemComponent < ViewComponent::Base
      attr_reader :base_url, :id, :brand_id, :brand, :query,
                  :thumbnail_url, :name, :data

      def initialize(
        base_url: "",
        id: nil,
        brand_id: nil,
        brand: Api::SPOTIFY,
        query: "",
        thumbnail_url: "",
        name: "",
        data: {}
      )
        @base_url = base_url
        @id = id
        @brand_id = brand_id
        @brand = brand
        @query = query
        @thumbnail_url = thumbnail_url
        @name = name
        @data = data
      end

      def classes
        "max-w-sm"
      end

      def href
        "#{base_url}/#{brand}/#{Api::TYPE_ALBUM}/search?artist=#{brand_id}"
      end
    end
  end
end
