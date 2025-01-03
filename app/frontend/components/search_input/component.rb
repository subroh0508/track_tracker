# frozen_string_literal: true

module SearchInput
  class Component < ViewComponent::Base
    attr_reader :id, :label, :type, :placeholder, :value,
                :url, :method, :data, :classes

    def initialize(
      id: "",
      label: "",
      type: "search",
      placeholder: nil,
      value: nil,
      url: "",
      method: "",
      data: {},
      classes: ""
    )
      @id = id
      @label = label
      @type = type
      @placeholder = placeholder
      @value = value
      @url = url
      @method = method
      @data = data
      @classes = classes
    end
  end
end
