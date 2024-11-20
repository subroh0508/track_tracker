# frozen_string_literal: true

module Youtube
  module Button
    LABEL_TEXT = "YouTube Music"

    class Component < ViewComponent::Base
      attr_reader :href, :active

      def initialize(
        href: "#",
        active: false,
        classes: "px-4 py-3"
      )
        @href = href
        @active = active
        @classes = classes
      end

      def classes
        [
          @classes,
          "inline-flex",
          "items-center",
          text_style,
        ].join(" ")
      end

      def label
        LABEL_TEXT
      end

      private

      def text_style
        [
          "rounded-lg",
          active ? active_text_style : "#{light_text_style} #{dark_text_style}",
        ].join(" ")
      end

      def active_text_style
        "text-white bg-youtube"
      end

      def light_text_style
        "text-neutral-500 bg-neutral-50 hover:text-neutral-900 hover:bg-neutral-100"
      end

      def dark_text_style
        "dark:text-neutral-400 dark:bg-neutral-800 dark:hover:text-white dark:hover:bg-neutral-700"
      end
    end
  end
end
