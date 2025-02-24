# frozen_string_literal: true

module Icon
  class CaretDown < Icon::Component
    def initialize(
      size: Icon::SIZE_MD,
      classes: ""
    )
      super(
        icon: "fas fa-caret-down #{size}",
        classes: classes
      )
    end
  end
end
