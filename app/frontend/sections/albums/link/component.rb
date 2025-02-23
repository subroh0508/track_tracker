# frozen_string_literal: true

module Albums
  module Link
    class Component < ViewComponent::Base
      def initialize(
        album_id: nil,
        label: "",
        classes: ""
      )
        @album_id = album_id
        @label = label
        @classes = classes
      end

      def classes
        [
          "w-full",
          "justify-center",
          @classes,
        ].join(" ")
      end

      def label?
        label.present?
      end

      def href
        throw NotImplementedError
      end

      protected

      attr_reader :album_id, :label
    end
  end
end
