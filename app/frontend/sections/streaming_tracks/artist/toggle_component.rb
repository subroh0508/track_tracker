# frozen_string_literal: true

module StreamingTracks
  module Artist
    class ToggleComponent < ViewComponent::Base
      attr_reader :base_url, :brand, :type, :query, :data, :classes

      def initialize(
        base_url: "",
        brand: Api::SPOTIFY,
        type: Api::TYPE_ARTIST,
        query: nil,
        checked: false,
        data: {},
        classes: ""
      )
        @base_url = base_url
        @brand = brand
        @type = type
        @query = query
        @checked = checked
        @data = data
        @classes = classes
      end

      def label_classes
        %w[
          inline-flex
          items-center
          cursor-pointer
        ].join(" ")
      end

      def toggle_switch_classes
        [
          "relative",
          light_toggle_switch_color_style,
          dark_toggle_switch_color_style,
          toggle_switch_style,
        ].join(" ")
      end

      def checked?
        @checked
      end

      def url
        next_type = (type == Api::TYPE_ARTIST) ? Api::TYPE_ALBUM : Api::TYPE_ARTIST

        "#{base_url}/#{brand}/#{next_type}/search"
      end

      private

      def light_toggle_switch_color_style
        %w[
        bg-neutral-200
        peer-checked:bg-primary-600
        peer-focus:outline-none
        peer-focus:ring-4
        peer-focus:ring-primary-300
      ].join(" ")
      end

      def dark_toggle_switch_color_style
        %w[
        dark:bg-neutral-700
        dark:border-neutral-600
        dark:peer-focus:ring-primary-800
      ].join(" ")
      end

      def toggle_switch_style
        %w[
        w-11
        h-6
        rounded-full
        peer
        peer-checked:after:translate-x-full
        peer-checked:after:border-white
        after:content-['']
        after:absolute
        after:top-[2px]
        after:start-[2px]
        after:bg-white
        after:border-neutral-300
        after:border
        after:rounded-full
        after:w-5
        after:h-5
        after:transition-all
      ]
      end
    end
  end
end
