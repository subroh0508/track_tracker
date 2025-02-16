# frozen_string_literal: true

module Users
  module Sessions
    class FormComponent < ViewComponent::Base
      attr_reader :url

      def initialize(
        url: "#",
        classes: ""
      )
        @url = url
        @classes = classes
      end

      def classes
        [
          @classes,
          "max-w-sm",
          "mx-auto",
        ].join(" ")
      end
    end
  end
end
