# frozen_string_literal: true

module InputField
  class Component < ViewComponent::Base
    renders_one :button, -> (label:, classes: "") do
      Button::Component.new(
        variant: Button::CONTAINED,
        type: "submit",
        classes: classes,
      ).with_content(label)
    end

    attr_reader :items, :classes

    def initialize(
      items: [],
      classes: ""
    )
      @items = items
      @classes = classes
    end
  end
end
