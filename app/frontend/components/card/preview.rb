# frozen_string_literal: true

# @logical_path components
class Card::Preview < ViewComponent::Preview
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
      c.with_thumbnail do
        c.render Card::ImageComponent.new(src: "https://i.ytimg.com/vi/Bsm9rQc7uew/hq720.jpg")
      end
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
