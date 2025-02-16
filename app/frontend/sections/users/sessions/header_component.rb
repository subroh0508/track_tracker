# frozen_string_literal: true

module Users
  module Sessions
    class HeaderComponent < ViewComponent::Base
      def initialize(classes: "")
        @classes = classes
      end

      def classes
        [
          @classes,
          "text-center",
          "text-3xl",
          "font-bold",
          "whitespace-nowrap",
          "dark:text-white",
        ].join(" ")
      end
    end
  end
end
