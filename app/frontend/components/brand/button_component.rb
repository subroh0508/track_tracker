# frozen_string_literal: true

module Brand
  class ButtonComponent < ViewComponent::Base
    attr_reader :brand, :href, :active, :classes

    def initialize(
      brand: nil,
      href: "#",
      active: false,
      classes: "px-4 py-3"
    )
      @brand = brand
      @href = href
      @active = active
      @classes = classes
    end

    def icon
      case brand
      when YOUTUBE_MUSIC
        "fa-brands fa-youtube fa-lg"
      when SPOTIFY
        "fa-brands fa-spotify"
      when APPLE_MUSIC
        "fa-brands fa-apple"
      else
        throw ArgumentError.new("Unknown brand: #{brand}")
      end
    end
  end
end
