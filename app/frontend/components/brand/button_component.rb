# frozen_string_literal: true

module Brand
  class ButtonComponent < ViewComponent::Base
    attr_reader :brand, :href, :active, :size, :data

    def initialize(
      brand: nil,
      href: "#",
      active: false,
      size: Link::Button::BASE,
      with_label: true,
      data: {},
      classes: ""
    )
      @brand = brand
      @href = href
      @active = active
      @size = size
      @with_label = with_label
      @data = data
      @classes = classes
    end

    def classes
      [
        @classes,
        size,
      ].join(" ")
    end

    def icon
      case brand
      when Api::YOUTUBE_MUSIC
        "fa-youtube"
      when Api::SPOTIFY
        "fa-spotify"
      when Api::APPLE_MUSIC
        "fa-apple"
      else
        throw ArgumentError.new("Unknown brand: #{brand}")
      end
    end

    def label
      case brand
      when Api::YOUTUBE_MUSIC
        t("streaming_services.youtube_music")
      when Api::SPOTIFY
        t("streaming_services.spotify")
      when Api::APPLE_MUSIC
        t("streaming_services.apple_music")
      else
        throw ArgumentError.new("Unknown brand: #{brand}")
      end
    end

    def active_text_color
      case brand
      when Api::YOUTUBE_MUSIC
        "text-white"
      when Api::SPOTIFY
        "text-black"
      when Api::APPLE_MUSIC
        "text-white"
      else
        throw ArgumentError.new("Unknown brand: #{brand}")
      end
    end

    def active_background_color
      case brand
      when Api::YOUTUBE_MUSIC
        "bg-youtubemusic"
      when Api::SPOTIFY
        "bg-spotify"
      when Api::APPLE_MUSIC
        "bg-applemusic"
      else
        throw ArgumentError.new("Unknown brand: #{brand}")
      end
    end

    def with_label?
      @with_label
    end
  end
end
