# frozen_string_literal: true

module StreamingTracks
  module SearchForm
    class BrandTabs < ViewComponent::Base
      attr_reader :brand

      def initialize(
        brand: Api::SPOTIFY,
        classes: ""
      )
        @brand = brand
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
    end
  end
end
