# frozen_string_literal: true

module Icon
  class User < Icon::Component
    def initialize(
      size: Icon::SIZE_MD,
      classes: ""
    )
      super(
        icon: "fas fa-user #{size}",
        classes: classes
      )
    end
  end
end
