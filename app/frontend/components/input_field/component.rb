# frozen_string_literal: true

module InputField
  class Component < ViewComponent::Base
    renders_one :button, Button::Component

    attr_reader :items, :button_label, :classes

    def initialize(
      items: [],
      button_label: nil,
      classes: ""
    )
      @items = items
      @button_label = button_label
      @classes = classes
    end

    def has_button?
      button_label.present?
    end
  end
end
