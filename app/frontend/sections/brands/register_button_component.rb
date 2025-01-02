# frozen_string_literal: true

module Brands
  class RegisterButtonComponent < ViewComponent::Base
    attr_reader :url, :id, :spotify_id, :youtube_video_id, :apple_music_id,
                :classes

    def initialize(
      url: "",
      id: nil,
      spotify_id: nil,
      youtube_video_id: nil,
      apple_music_id: nil,
      classes: ""
    )
      @url = url
      @id = id
      @spotify_id = spotify_id
      @youtube_video_id = youtube_video_id
      @apple_music_id = apple_music_id
      @classes = classes
    end
  end
end
