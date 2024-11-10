# frozen_string_literal: true

module Form
  class InputComponent < ViewComponent::Base
    attr_reader :type, :id, :placeholder

    def initialize(
      type: "text",
      id: "",
      placeholder: nil,
      required: false
    )
      @type = type
      @id = id
      @placeholder = placeholder
      @required = required
    end

    def classes
      [
        "block w-full p-2.5",
        text_style,
        border_style,
      ].join(" ")
    end

    def required?
      @required
    end

    private

    def text_style
      [
        "text-sm",
        light_text_style,
        dark_text_style,
      ].join(" ")
    end

    def light_text_style
      "bg-neutral-50 text-neutral-900"
    end

    def dark_text_style
      "dark:bg-neutral-700 dark:placeholder-neutral-400 dark:text-white"
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
      "border-neutral-300 focus:ring-primary-500 focus:border-primary-500"
    end

    def dark_border_style
      "dark:border-neutral-600 dark:focus:ring-primary-500 dark:focus:border-primary-500"
    end
  end
end
