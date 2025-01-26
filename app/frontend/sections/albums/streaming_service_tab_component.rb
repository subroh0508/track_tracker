# frozen_string_literal: true

module Albums
  class StreamingServiceTabComponent < ViewComponent::Base
    attr_reader :data

    def initialize(
      base_url: "",
      id: nil,
      streaming_service: Api::SPOTIFY,
      data: {},
      classes: ""
    )
      @base_url = base_url
      @id = id
      @streaming_service = streaming_service
      @data = data
      @classes = classes
    end
    def classes
      [
        "flex",
        "gap-2",
        @classes,
      ].join(" ")
    end

    def spotify?
      streaming_service == Api::SPOTIFY
    end

    def apple_music?
      streaming_service == Api::APPLE_MUSIC
    end

    def youtube_music?
      streaming_service == Api::YOUTUBE_MUSIC
    end

    def href_spotify
      "#{base_url}/#{id}?streaming_service=#{Api::SPOTIFY}"
    end

    def href_apple_music
      "#{base_url}/#{id}?streaming_service=#{Api::APPLE_MUSIC}"
    end

    def href_youtube_music
      "#{base_url}/#{id}?streaming_service=#{Api::YOUTUBE_MUSIC}"
    end

    private

    attr_reader :base_url, :id, :streaming_service
  end
end
