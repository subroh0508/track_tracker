# frozen_string_literal: true

module Icon
  class Component < ViewComponent::Base
    attr_reader :icon, :classes

    def initialize(
      icon: "",
      classes: ""
    )
      @icon = icon
      @classes = classes
    end
  end
end
