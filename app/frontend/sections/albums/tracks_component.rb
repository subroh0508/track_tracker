# frozen_string_literal: true

module Albums
  class TracksComponent < ViewComponent::Base
    attr_reader :tracks, :classes

    def initialize(
      tracks,
      classes: "px-4"
    )
      @tracks = tracks
      @classes = classes
    end

    def index_style
      "h-12 mb-12 #{light_index_style} #{dark_index_style}"
    end

    def content_style
      "h-20"
    end

    private

    def light_index_style
      "text-neutral-700"
    end

    def dark_index_style
      "dark:text-neutral-400"
    end
  end
end
