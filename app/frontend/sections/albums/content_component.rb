# frozen_string_literal: true

module Albums
  class ContentComponent < ViewComponent::Base
    attr_reader :album, :classes

    def initialize(
      base_url: "",
      album: nil,
      classes: ""
    )
      @base_url = base_url
      @album = album
      @classes = classes
    end

    def icon
      throw NotImplementedError
    end

    def icon_label
      throw NotImplementedError
    end

    def href
      throw NotImplementedError
    end

    protected

    attr_reader :base_url
  end
end
