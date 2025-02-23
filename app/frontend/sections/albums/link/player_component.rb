# frozen_string_literal: true

module Albums
  module Link
    class PlayerComponent < Albums::Link::Component
      def initialize(
        album_id: nil,
        label: "",
        classes: ""
      )
        super(
          album_id: album_id,
          label: label,
          classes: classes,
        )
      end

      def href
        url_for(
          controller: :albums,
          action: :player,
          id: album_id,
        )
      end
    end
  end
end
