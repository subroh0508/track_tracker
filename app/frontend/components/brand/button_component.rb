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
        "fa-youtube"
      when SPOTIFY
        "fa-spotify"
      when APPLE_MUSIC
        "fa-apple"
      else
        throw ArgumentError.new("Unknown brand: #{brand}")
      end
    end

    def active_text_color
      case brand
      when YOUTUBE_MUSIC
        "text-white"
      when SPOTIFY
        "text-black"
      when APPLE_MUSIC
        "text-white"
      else
        throw ArgumentError.new("Unknown brand: #{brand}")
      end
    end

    def active_background_color
      case brand
      when YOUTUBE_MUSIC
        "bg-youtubemusic"
      when SPOTIFY
        "bg-spotify"
      when APPLE_MUSIC
        "bg-applemusic"
      else
        throw ArgumentError.new("Unknown brand: #{brand}")
      end
    end
  end
end
