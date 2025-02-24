# frozen_string_literal: true

module Albums
  module Form
    module Input
      class IdComponent < ViewComponent::Base
        attr_reader :item

        def initialize(
          item:,
          classes: ""
        )
          @item = item
          @classes = classes
        end

        def classes
          [
            @classes,
          ].join(" ")
        end

        def url
          if item.icon_class == Icon::Spotify
            "#"
          elsif item.icon_class == Icon::AppleMusic
            "#"
          elsif item.icon_class == Icon::YoutubeMusic
            "#"
          else
            throw ArgumentError
          end
        end
      end
    end
  end
end
