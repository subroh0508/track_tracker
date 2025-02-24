# frozen_string_literal: true

module Textarea
  class Component < ViewComponent::Base
    attr_reader :id, :name, :placeholder, :rows, :value

    def initialize(
      id: "",
      name: nil,
      placeholder: nil,
      rows: 2,
      required: false,
      disabled: false,
      value: nil,
      classes: ""
    )
      @id = id
      @name = name&.presence
      @placeholder = placeholder
      @rows = rows
      @required = required
      @disabled = disabled
      @value = value
      @classes = classes
    end

    def classes
      [
        @classes,
        "py-2",
        "px-3",
        text_style,
        border_style,
      ].join(" ")
    end

    def required?
      @required
    end

    def disabled?
      @disabled
    end

    private

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
