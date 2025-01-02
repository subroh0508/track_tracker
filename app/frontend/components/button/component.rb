# frozen_string_literal: true

module Button
  class Component < ViewComponent::Base
    attr_reader :variant, :type, :shape, :size

    def initialize(
      variant: Button::TEXT,
      type: "button",
      shape: Button::ROUNDED,
      size: Button::BASE,
      classes: ""
    )
      @variant = variant
      @type = type
      @shape = shape
      @size = size
      @classes = classes
    end

    def classes
      [
        @classes,
        size,
        text_style,
        border,
      ].join(" ")
    end

    private

    def text_style
      [
        light_text_style,
        dark_text_style,
      ].join(" ")
    end

    def border
      [
        light_border,
        dark_border,
      ].join(" ")
    end

    def common_text_style
      "font-medium"
    end

    def light_text_style
      case variant
      when CONTAINED
        "#{common_text_style} text-white bg-primary-700 hover:bg-primary-800"
      when OUTLINED
        "#{common_text_style} text-primary-700 hover:text-white hover:bg-primary-800"
      else
        "#{common_text_style} text-primary-700 hover:bg-primary-100"
      end
    end

    def dark_text_style
      case variant
      when CONTAINED
        "#{common_text_style} dark:bg-primary-600 dark:hover:bg-primary-700"
      when OUTLINED
        "#{common_text_style} dark:text-primary-500 dark:hover:text-white dark:hover:bg-primary-700"
      else
        "#{common_text_style} dark:text-primary-500 dark:hover:bg-primary-900"
      end
    end

    def light_border
      case variant
      when OUTLINED
        "#{shape} border border-primary-700 hover:bg-primary-800"
      else
        shape
      end
    end

    def dark_border
      case variant
      when OUTLINED
        "#{shape} border dark:border-primary-500 dark:hover:border-primary-700"
      else
        shape
      end
    end
  end
end
