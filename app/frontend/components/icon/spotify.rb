# frozen_string_literal: true

module Icon
  class Spotify < Icon::Component
    def initialize(
      size: Icon::SIZE_MD,
      classes: ""
    )
      super(
        icon: "fab fa-spotify #{size}",
        classes: classes
      )
    end
  end
end
