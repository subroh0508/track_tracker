# frozen_string_literal: true

module Input
  class ToggleComponent < ViewComponent::Base
    def initialize(
      checked: false,
      disabled: false,
      classes: ""
    )
      @checked = checked
      @disabled = disabled
      @classes = classes
    end

    def classes
      [
        "inline-flex",
        "items-center",
        disabled? ? "cursor-not-allowed" : "cursor-pointer",
        @classes,
      ].join(" ")
    end

    def label_classes
      %w[
        ms-3
        text-sm
        font-medium
        text-neutral-900
        dark:text-neutral-300
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

    def disabled?
      @disabled
    end

    private

    def light_toggle_switch_color_style
      %w[
        bg-neutral-200
        peer-checked:bg-primary-600
        peer-focus:outline-hiddend
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
