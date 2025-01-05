# frozen_string_literal: true

module StreamingTracks
  module Album
    class TargetItemComponent < ViewComponent::Base
      attr_reader :album, :classes

      def initialize(
        album: nil,
        classes: ""
      )
        @album = album
        @classes = classes
      end

      def track_artist(track)
        track[:artists].map { |artist| artist[:name] }.join(",")
      end
    end
  end
end
