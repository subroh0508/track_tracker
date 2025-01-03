# frozen_string_literal: true

module StreamingTracks
  class SearchFormComponent < ViewComponent::Base
    attr_reader :base_url, :brand, :type, :query, :data, :classes

    def initialize(
      base_url: "",
      brand: Api::SPOTIFY,
      type: Api::TYPE_ALBUM,
      query: nil,
      data: {},
      classes: ""
    )
      @base_url = base_url
      @brand = brand
      @type = type
      @query = query
      @data = data
      @classes = classes
    end

    def url
      "#{base_url}/#{brand}/#{type}?query=#{query}"
    end

    def href_spotify
      "#{base_url}/#{Api::SPOTIFY}/#{type}?query=#{query}"
    end

    def href_youtube_music
      "#{base_url}/#{Api::YOUTUBE_MUSIC}/#{type}?query=#{query}"
    end

    def href_apple_music
      "#{base_url}/#{Api::APPLE_MUSIC}/#{type}?query=#{query}"
    end

    def href_album
      "#{base_url}/#{brand}/album?query=#{query}"
    end

    def href_artist
      "#{base_url}/#{brand}/artist?query=#{query}"
    end

    def href_track
      "#{base_url}/#{brand}/track?query=#{query}"
    end
  end
end
