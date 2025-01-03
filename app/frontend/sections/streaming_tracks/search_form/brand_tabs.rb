# frozen_string_literal: true

module StreamingTracks
  module SearchForm
    class BrandTabs < ViewComponent::Base
      attr_reader :base_url, :brand, :type, :query, :data

      def initialize(
        base_url: "",
        brand: Api::SPOTIFY,
        type: Api::TYPE_ALBUM,
        query: nil,
        data: {},
        classes: ""
      )
        @base_url = base_url
        @brand = brand
        @type = type
        @query = query
        @data = data
        @classes = classes
      end

      def classes
        [
          "grid",
          "grid-flow-col",
          "justify-stretch",
          "gap-2",
          @classes,
        ].join(" ")
      end

      def href_spotify
        "#{base_url}/#{Api::SPOTIFY}/#{type}/search?query=#{query}"
      end

      def href_apple_music
        "#{base_url}/#{Api::APPLE_MUSIC}/#{type}/search?query=#{query}"
      end
    end
  end
end
