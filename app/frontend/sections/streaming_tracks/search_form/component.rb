# frozen_string_literal: true

module StreamingTracks
  module SearchForm
    class Component < ViewComponent::Base
      attr_reader :brand, :type, :query, :artist, :data, :classes

      def initialize(
        brand: Api::SPOTIFY,
        type: Api::TYPE_ALBUM,
        query: nil,
        artist: nil,
        data: {},
        classes: ""
      )
        @brand = brand
        @type = type
        @query = query
        @artist = artist
        @data = data
        @classes = classes
      end

      def classes
        [
          "flex",
          "flex-col",
          "gap-3",
          @classes,
        ].join(" ")
      end

      def url
        "#{base_url}/#{brand}/#{type}?query=#{query}"
      end

      def artist_query
        type == Api::TYPE_ARTIST ? query : nil
      end

      def album_query
        type == Api::TYPE_ALBUM ? query : nil
      end
    end
  end
end
