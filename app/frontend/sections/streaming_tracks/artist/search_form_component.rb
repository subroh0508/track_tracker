# frozen_string_literal: true

module StreamingTracks
  module Artist
    class SearchFormComponent < ViewComponent::Base
      attr_reader :base_url, :brand, :type, :query, :artist, :data, :classes

      def initialize(
        base_url: "",
        brand: Api::SPOTIFY,
        type: Api::TYPE_ARTIST,
        query: nil,
        artist: nil,
        data: {},
        classes: ""
      )
        @base_url = base_url
        @brand = brand
        @type = type
        @query = query
        @artist = artist
        @data = data
        @classes = classes
      end

      def url
        "#{base_url}/#{brand}/#{Api::TYPE_ARTIST}/search"
      end

      def label
        "アーティスト名#{visible? ? "" : "でフィルタ"}"
      end

      def value
        artist.blank? ? query : artist[:name]
      end

      def visible?
        type == Api::TYPE_ARTIST || artist.present?
      end

      def disabled?
        type != Api::TYPE_ARTIST || artist.present?
      end
    end
  end
end
