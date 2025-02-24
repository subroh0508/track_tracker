# frozen_string_literal: true

module Albums
  module Form
    class ContentComponent < ViewComponent::Base
      attr_reader :album, :classes

      def initialize(
        album: nil,
        classes: ""
      )
        @album = album
        @classes = classes
      end

      def form_classes
        %w[
          mt-4
        ].join(" ")
      end
    end
  end
end
