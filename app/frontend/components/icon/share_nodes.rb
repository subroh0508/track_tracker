# frozen_string_literal: true

module Icon
  class ShareNodes < Icon::Component
    def initialize(
      size: Icon::SIZE_MD,
      classes: ""
    )
      super(
        icon: "fas fa-share-nodes #{size}",
        classes: classes
      )
    end
  end
end
