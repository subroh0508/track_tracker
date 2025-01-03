# frozen_string_literal: true

module Button
  class Component < ViewComponent::Base
    attr_reader :variant, :icon, :type, :shape, :size

    def initialize(
      variant: Button::TEXT,
      icon: nil,
      disabled: false,
      type: "button",
      shape: Button::ROUNDED,
      size: Button::BASE,
      classes: ""
    )
      @variant = variant
      @icon = icon
      @disabled = disabled
      @type = type
      @shape = shape
      @size = size
      @classes = classes
    end

    def classes
      [
        @classes,
        size,
        disabled? ? disabled_text_style : text_style,
        disabled? ? "cursor-not-allowed" : "",
        disabled? ? disabled_border_style : border_style,
      ].join(" ")
    end

    def icon?
      icon.present?
    end

    def disabled?
      @disabled
    end

    private

    def text_style
      [
        "font-medium",
        light_text_style,
        dark_text_style,
      ].join(" ")
    end

    def disabled_text_style
      [
        "font-medium",
        disabled_light_text_style,
        disabled_dark_text_style,
      ].join(" ")
    end

    def border_style
      [
        shape,
        light_border_style,
        dark_border_style,
      ].join(" ")
    end

    def disabled_border_style
      [
        shape,
        disabled_light_border_style,
        disabled_dark_border_style,
      ].join(" ")
    end

    def light_text_style
      case variant
      when CONTAINED
        "text-white bg-primary-700 hover:bg-primary-800"
      when OUTLINED
        "text-primary-700 hover:text-white hover:bg-primary-800"
      else
        "text-primary-700 hover:bg-primary-100"
      end
    end

    def disabled_light_text_style
      case variant
      when CONTAINED
        "text-white bg-primary-400 cursor-not-allowed"
      when OUTLINED
        "text-neutral-300"
      else
        "text-neutral-300"
      end
    end

    def dark_text_style
      case variant
      when CONTAINED
        "dark:bg-primary-600 dark:hover:bg-primary-700"
      when OUTLINED
        "dark:text-primary-500 dark:hover:text-white dark:hover:bg-primary-700"
      else
        "dark:text-primary-500 dark:hover:bg-primary-900"
      end
    end

    def disabled_dark_text_style
      case variant
      when CONTAINED
        "dark:bg-primary-400"
      when OUTLINED
        "dark:text-neutral-500"
      else
        "dark:text-neutral-500"
      end
    end

    def light_border_style
      case variant
      when OUTLINED
        "border border-primary-700 hover:bg-primary-800"
      else
        ""
      end
    end

    def dark_border_style
      case variant
      when OUTLINED
        "border dark:border-primary-500 dark:hover:border-primary-700"
      else
        ""
      end
    end

    def disabled_light_border_style
      case variant
      when OUTLINED
        "border border-neutral-300"
      else
        ""
      end
    end

    def disabled_dark_border_style
      case variant
      when OUTLINED
        "border dark:border-neutral-500"
      else
        ""
      end
    end
  end
end
