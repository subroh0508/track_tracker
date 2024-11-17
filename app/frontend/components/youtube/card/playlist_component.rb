# frozen_string_literal: true

module Youtube
  module Card
    class PlaylistComponent < Youtube::Card::Component
      attr_reader :tracks

      def initialize(
        id: nil,
        title: nil,
        tracks: [],
        classes: nil
      )
        super(id: id, title: title, classes: classes)

        @tracks = tracks
      end
    end
  end
end
