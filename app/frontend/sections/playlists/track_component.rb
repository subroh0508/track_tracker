# frozen_string_literal: true

module Playlists
  class TrackComponent < ViewComponent::Base
    attr_reader :track

    def initialize(
      track,
      classes: ""
    )
      @track = track
      @classes = classes
    end

    def classes
      "inline-block px-4 #{@classes}"
    end

    def index_style
      "#{light_index_style} #{dark_index_style}"
    end

    def thumbnail_style
      "object-cover rounded-md"
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
