# frozen_string_literal: true

module Albums
  module Link
    class TrackListComponent < Albums::Link::Component
      def initialize(
        base_url: "",
        album_id: nil,
        classes: ""
      )
        super(
          base_url: base_url,
          album_id: album_id,
          classes: classes,
        )
      end

      def href
        "#{base_url}/#{album_id}/player"
      end
    end
  end
end
