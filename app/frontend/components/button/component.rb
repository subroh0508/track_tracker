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
      case variant
      when CONTAINED
        "#{common_text_style} text-white bg-primary-700 hover:bg-primary-800 dark:bg-primary-600 dark:hover:bg-primary-700"
      else
        "#{common_text_style} text-primary-700 hover:bg-primary-100 dark:text-primary-200 dark:hover:bg-primary-900"
      end
    end

    def border
      case variant
      when OUTLINED
        "#{common_border} border border-primary-700 dark:border-primary-200"
      else
        common_border
      end
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

    def common_border
      "rounded-lg"
    end
  end
end
