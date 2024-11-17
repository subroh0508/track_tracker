# frozen_string_literal: true

module SearchInput
  class Component < ViewComponent::Base
    attr_reader :id, :label, :type, :placeholder,
                :url, :method, :data, :classes

    def initialize(
      id: "",
      label: "",
      type: "search",
      placeholder: nil,
      url: "",
      method: "",
      data: {},
      classes: ""
    )
      @id = id
      @label = label
      @type = type
      @placeholder = placeholder
      @url = url
      @method = method
      @data = data
      @classes = classes
    end
  end
end
