# frozen_string_literal: true

module Albums
  module Form
    class UpdateButtonComponent < ViewComponent::Base
      attr_reader :id

      def initialize(
        id: nil,
        classes: ""
      )
        @id = id
        @classes = classes
      end

      def classes
        [
          "inline-flex",
          "rounded-lg",
          @classes,
        ].join(" ")
      end

      def primary_button_classes
        [
          "border-r",
          "rounded-l-lg",
          border_color_style,
        ].join(" ")
      end

      def dropdown_button_classes
        %w[
          p-2.5
          text-white
          bg-primary-700
          hover:bg-primary-800
          dark:bg-primary-600
          dark:hover:bg-primary-700
          rounded-r-lg
        ].join(" ")
      end

      def form_action(id, streaming_service = nil)
        url_for(
          controller: :albums,
          action: :update,
          id: id,
          params: {
            streaming_service: streaming_service,
          },
        )
      end

      private

      def border_color_style
        %w[
          border-primary-800
          dark:border-primary-700
        ].join(" ")
      end
    end
  end
end
