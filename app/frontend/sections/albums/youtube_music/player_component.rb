# frozen_string_literal: true

module Albums
  module YoutubeMusic
    class PlayerComponent < ViewComponent::Base
      attr_reader :classes

      def initialize(
        youtube_music_id: nil,
        classes: ""
      )
        @youtube_music_id = youtube_music_id
        @classes = classes
      end

      def src
        "https://www.youtube.com/embed/videoseries?list=#{youtube_music_id}"
      end

      def present_youtube_music_id?
        youtube_music_id.present?
      end

      private

      attr_reader :youtube_music_id
    end
  end
end
