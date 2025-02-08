# frozen_string_literal: true

module Albums
  class TracksComponent < ViewComponent::Base
    attr_reader :tracks, :classes

    def initialize(
      tracks,
      classes: ""
    )
      @tracks = tracks
      @classes = classes
    end

    def description(track)
      track[:artists].map { |artist| artist[:name] }.join(", ")
    end

    def url_spotify(track)
      "https://open.spotify.com/track/#{track[:spotify_id]}"
    end

    def url_apple_music(track)
      ""
    end

    def url_youtube_music(track)
      "https://music.youtube.com/watch?v=#{track[:youtube_music_id]}"
    end
  end
end
