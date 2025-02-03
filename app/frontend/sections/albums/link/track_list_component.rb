# frozen_string_literal: true

module Albums
  module Link
    class TrackListComponent < Albums::Link::Component
      def initialize(
        base_url: "",
        album_id: nil,
        label: "",
        classes: ""
      )
        super(
          base_url: base_url,
          album_id: album_id,
          label: label,
          classes: classes,
        )
      end

      def href
        "#{base_url}/#{album_id}"
      end
    end
  end
end
