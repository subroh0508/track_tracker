# frozen_string_literal: true

module Icon
  class FloppyDisk < Icon::Component
    def initialize(
      size: Icon::SIZE_MD,
      classes: ""
    )
      super(
        icon: "fas fa-floppy-disk #{size}",
        classes: classes
      )
    end
  end
end
