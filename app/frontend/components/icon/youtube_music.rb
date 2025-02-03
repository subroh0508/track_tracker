# frozen_string_literal: true

module Icon
  class YoutubeMusic < Icon::Component
    def initialize(
      size: Icon::SIZE_MD,
      classes: ""
    )
      super(
        icon: "fab fa-youtube #{size}",
        classes: classes
      )
    end
  end
end
