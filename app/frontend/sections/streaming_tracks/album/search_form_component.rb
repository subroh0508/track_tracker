# frozen_string_literal: true

module StreamingTracks
  module Album
    class SearchFormComponent < ViewComponent::Base
      attr_reader :url, :query, :data, :classes

      def initialize(
        url: "",
        query: nil,
        data: {},
        classes: ""
      )
        @url = url
        @query = query
        @data = data
        @classes = classes
      end
    end
  end
end
