# frozen_string_literal: true

module Icon
  class Lock < Icon::Component
    def initialize(
      size: Icon::SIZE_MD,
      classes: ""
    )
      super(
        icon: "fas fa-lock #{size}",
        classes: classes
      )
    end
  end
end
