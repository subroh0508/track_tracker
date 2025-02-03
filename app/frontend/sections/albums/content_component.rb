# frozen_string_literal: true

module Albums
  class ContentComponent < ViewComponent::Base
    attr_reader :album, :classes

    def initialize(
      album: nil,
      classes: ""
    )
      @album = album
      @classes = classes
    end
  end
end
