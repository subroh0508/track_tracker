# frozen_string_literal: true

module Albums
  class ContentForPlayerComponent < Albums::ContentComponent
    def icon
      "fas fa-list"
    end

    def icon_label
      "トラックリストを開く"
    end

    def href
      "#{base_url}/#{album[:id]}"
    end
  end
end
