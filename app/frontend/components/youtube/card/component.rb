# frozen_string_literal: true

module Youtube
  module Card
    class Component < ViewComponent::Base
      attr_reader :id, :title, :classes

      def initialize(
        id: nil,
        title: nil,
        classes: ""
      )
        @id = id
        @title = title
        @classes = classes
      end
    end
  end
end
