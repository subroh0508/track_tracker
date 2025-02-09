# frozen_string_literal: true

module Icon
  class CircleUser < Icon::Component
    def initialize(
      size: Icon::SIZE_MD,
      classes: ""
    )
      super(
        icon: "fas fa-circle-user #{size}",
        classes: classes
      )
    end
  end
end
