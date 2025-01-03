# frozen_string_literal: true

module StreamingTracks
  module SearchForm
    class Component < ViewComponent::Base
      attr_reader :brand, :type, :query, :data, :classes

      def initialize(
        brand: Api::SPOTIFY,
        type: Api::TYPE_ALBUM,
        query: nil,
        data: {},
        classes: ""
      )
        @brand = brand
        @type = type
        @query = query
        @data = data
        @classes = classes
      end

      def url
        "#{base_url}/#{brand}/#{type}?query=#{query}"
      end
    end
  end
end