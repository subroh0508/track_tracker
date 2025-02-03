# frozen_string_literal: true

module Icon
  class AppleMusic < Icon::Component
    def initialize(
      size: Icon::SIZE_MD,
      classes: ""
    )
      super(
        icon: "fab fa-apple #{size}",
        classes: classes
      )
    end
  end
end
