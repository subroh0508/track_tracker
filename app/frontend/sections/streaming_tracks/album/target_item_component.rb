# frozen_string_literal: true

module StreamingTracks
  module Album
    class TargetItemComponent < ViewComponent::Base
      attr_reader :album, :params, :classes

      def initialize(
        album: nil,
        params: {
          brand: Api::SPOTIFY,
        },
        classes: ""
      )
        @album = album
        @params = params
        @classes = classes
      end

      def track_artist(track)
        track[:artists].map { |artist| artist[:name] }.join(",")
      end
    end
  end
end
