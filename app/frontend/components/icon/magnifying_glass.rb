# frozen_string_literal: true

module Icon
  class MagnifyingGlass < Icon::Component
    def initialize(
      size: Icon::SIZE_MD,
      classes: ""
    )
      super(
        icon: "fas fa-magnifying-glass #{size}",
        classes: classes
      )
    end
  end
end
