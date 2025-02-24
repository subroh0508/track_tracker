# frozen_string_literal: true

module Input
  class Component < ViewComponent::Base
    renders_one :icon, ->(icon_class:) do
      icon_class.new(
        classes: "w-4 h-4 text-neutral-500 dark:text-neutral-400",
      )
    end

    renders_one :button

    attr_reader :type, :id, :name, :placeholder, :value

    def initialize(
      type: "text",
      id: "",
      name: nil,
      placeholder: nil,
      required: false,
      disabled: false,
      value: nil,
      classes: ""
    )
      @type = type
      @id = id
      @name = name&.presence
      @placeholder = placeholder
      @required = required
      @disabled = disabled
      @value = value
      @classes = classes
    end

    def classes
      [
        display,
        @classes,
      ].join(" ")
    end

    def required?
      @required
    end

    def disabled?
      @disabled
    end

    def plain?
      !icon? && !button?
    end

    private

    def display
      case
      when plain?
        "py-2 px-3"
      when type == "hidden"
        "hidden"
      else
        "flex items-center gap-2"
      end
    end

    def text_style
      [
        "text-sm",
        "disabled:cursor-not-allowed",
        light_text_style,
        dark_text_style,
      ].join(" ")
    end

    def light_text_style
      %w[
        bg-neutral-50
        text-neutral-900
        disabled:bg-neutral-100
      ].join(" ")
    end

    def dark_text_style
      %w[
        dark:bg-neutral-700
        dark:placeholder-neutral-400
        dark:text-white
        dark:disabled:text-neutral-400
      ].join(" ")
    end

    def border_style
      [
        "border",
        "rounded-lg",
        light_border_style,
        dark_border_style,
      ].join(" ")
    end

    def light_border_style
      %w[
        border-neutral-300
        focus:ring-primary-500
        focus:border-primary-500
      ].join(" ")
    end

    def dark_border_style
      %w[
        dark:border-neutral-600
        dark:focus:ring-primary-500
        dark:focus:border-primary-500
      ].join(" ")
    end
  end
end
