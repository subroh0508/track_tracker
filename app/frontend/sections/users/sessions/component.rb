# frozen_string_literal: true

module Users
  module Sessions
    class Component < ViewComponent::Base
      attr_reader :url

      def initialize(url: "#")
        @url = url
      end
    end
  end
end
