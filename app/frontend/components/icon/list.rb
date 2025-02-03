# frozen_string_literal: true

module Icon
  class List < Icon::Component
    def initialize(
      size: Icon::SIZE_MD,
      classes: ""
    )
      super(
        icon: "fas fa-list #{size}",
        classes: classes
      )
    end
  end
end
