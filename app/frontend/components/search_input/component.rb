# frozen_string_literal: true

module SearchInput
  class Component < ViewComponent::Base
    attr_reader :id, :label, :type, :placeholder, :classes

    def initialize(
      id: "",
      label: "",
      type: "search",
      placeholder: nil,
      classes: ""
    )
      @id = id
      @label = label
      @type = type
      @placeholder = placeholder
      @classes = classes
    end
  end
end
