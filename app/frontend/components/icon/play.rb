# frozen_string_literal: true

module Icon
  class Play < Icon::Component
    def initialize(
      size: Icon::SIZE_MD,
      classes: ""
    )
      super(
        icon: "fas fa-play #{size}",
        classes: classes
      )
    end
  end
end
