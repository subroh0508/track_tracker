# frozen_string_literal: true

module Users
  module Sessions
    class FormComponent < ViewComponent::Base
      attr_reader :classes, :url

      def initialize(
        url: "#",
        classes: ""
      )
        @url = url
        @classes = classes
      end
    end
  end
end
