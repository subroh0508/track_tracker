# frozen_string_literal: true

module Albums
  module Link
    class ShareComponent < Albums::Link::Component
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
        "#"
      end
    end
  end
end
