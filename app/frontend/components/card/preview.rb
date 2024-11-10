# frozen_string_literal: true

module Card
  class Preview < ViewComponent::Preview
    # @!group Style
    def default
      render Card::Component.new(classes: "max-w-sm") do |c|
        c.with_header { "illumination STARS" }
        c.with_description do
          c.render Card::DescriptionComponent.new do
            "Infinite Possibilities, Shining in Their Eyes"
          end
        end
      end
    end

    def with_image
      render Card::Component.new(classes: "max-w-sm") do |c|
        c.with_image(src: "https://i.ytimg.com/vi/Bsm9rQc7uew/hq720.jpg")
        c.with_header { "Shinography" }
        c.with_description do
          c.render Card::DescriptionComponent.new do
            "SHINY COLORS - Topic"
          end
        end
      end
    end
    # @!endgroup
  end
end
