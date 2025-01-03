# frozen_string_literal: true

module StreamingTracks
  module Album
    class SearchFormComponent < ViewComponent::Base
      attr_reader :base_url, :brand, :type, :query, :data, :classes

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

      def url
        "#{base_url}/#{brand}/#{Api::TYPE_ALBUM}/search"
      end
    end
  end
end
