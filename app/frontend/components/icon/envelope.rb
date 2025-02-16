# frozen_string_literal: true

module Icon
  class Envelope < Icon::Component
    def initialize(
      size: Icon::SIZE_MD,
      classes: ""
    )
      super(
        icon: "fas fa-envelope #{size}",
        classes: classes
      )
    end
  end
end
