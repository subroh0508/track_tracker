# frozen_string_literal: true

module Albums
  module Link
    class Component < ViewComponent::Base
      def initialize(
        base_url: "",
        album_id: nil,
        classes: ""
      )
        @base_url = base_url
        @album_id = album_id
        @classes = classes
      end

      def classes
        [
          "w-full",
          "justify-center",
          @classes,
        ].join(" ")
      end

      def href
        throw NotImplementedError
      end

      protected

      attr_reader :base_url, :album_id
    end
  end
end
