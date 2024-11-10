# frozen_string_literal: true

module Form
  class Component < ViewComponent::Base
    renders_many :items
    renders_one :button, Button::Component

    attr_reader :classes

    def initialize(classes: "")
      @classes = classes
    end
  end
end
