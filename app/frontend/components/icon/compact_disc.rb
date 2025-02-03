# frozen_string_literal: true

module Icon
  class CompactDisc < Icon::Component
    def initialize(
      size: Icon::SIZE_MD,
      classes: ""
    )
      super(
        icon: "fas fa-compact-disc #{size}",
        classes: classes
      )
    end
  end
end
