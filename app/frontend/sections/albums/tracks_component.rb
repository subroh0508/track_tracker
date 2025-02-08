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

    def duration(ms)
      minutes = ms / 1000 / 60
      seconds = (ms / 1000) % 60

      "#{minutes}:#{seconds.to_s.rjust(2, "0")}"
    end
  end
end
