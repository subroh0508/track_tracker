# frozen_string_literal: true

module Albums
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
      "px-4 #{@classes}"
    end

    def thumbnail_style
      "object-cover rounded-md"
    end

    def description
      track[:artists].map { |artist| artist[:name] }.join(", ")
    end
  end
end
