# frozen_string_literal: true

module Card
  class ImageComponent < ViewComponent::Base
    attr_reader :src

    def initialize(src: nil)
      @src = src
    end

    def classes
      "rounded-t-lg"
    end
  end
end
