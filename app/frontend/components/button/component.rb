# frozen_string_literal: true

module Button
  TEXT = "text"
  CONTAINED = "contained"
  OUTLINED = "outlined"

  class Component < ViewComponent::Base
    attr_reader :variant

    def initialize(variant: Button::TEXT)
      @variant = variant
    end

    def classes
      [
        text_style,
        border,
        padding,
        margin,
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

    def padding
      "px-5 py-2.5"
    end

    def margin
      "me-2 mb-2"
    end

    def common_text_style
      "text-sm font-medium"
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

    def common_border
      "rounded-lg"
    end

    def light_border
      case variant
      when OUTLINED
        "#{common_border} border border-primary-700 hover:bg-primary-800"
      else
        common_border
      end
    end

    def dark_border
      case variant
      when OUTLINED
        "#{common_border} border dark:border-primary-500 dark:hover:border-primary-700"
      else
        common_border
      end
    end
  end
end
