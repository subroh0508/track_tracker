# frozen_string_literal: true

module Brands
  class SearchFormComponent < ViewComponent::Base
    attr_reader :current_brand

    def initialize(
      current_brand: Api::SPOTIFY
    )
      @current_brand = current_brand
    end

    def icon_spotify_classes
      [
        icon_classes,
        "fa-spotify",
        current_brand == Api::SPOTIFY ? "text-spotify" : "text-neutral-400",
      ].join(" ")
    end

    def icon_youtube_classes
      [
        icon_classes,
        "fa-youtube",
        current_brand == Api::YOUTUBE_MUSIC ? "text-youtubemusic" : "text-neutral-400",
      ].join(" ")
    end

    def icon_apple_classes
      [
        icon_classes,
        "fa-apple",
        current_brand == Api::APPLE_MUSIC ? "text-applemusic" : "text-neutral-400",
      ].join(" ")
    end

    private

    def icon_classes
      %w[
        me-2
        fa-brands
        fa-lg
      ].join(" ")
    end
  end
end
