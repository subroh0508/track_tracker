# frozen_string_literal: true

module Albums
  class ContentForTrackListComponent < Albums::ContentComponent
    def icon
      "fas fa-play"
    end

    def icon_label
      "プレイヤーを開く"
    end

    def href
      "#{base_url}/#{album[:id]}/player"
    end
  end
end
