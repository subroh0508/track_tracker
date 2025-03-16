# frozen_string_literal: true

module StreamingService
  module Common
    def detect_column_name_by_streaming_service_id(params)
      case
      when params.key?(Streaming::KEY_SPOTIFY)
        Streaming::KEY_SPOTIFY
      when params.key?(Streaming::KEY_APPLE_MUSIC)
        Streaming::KEY_APPLE_MUSIC
      when params.key?(Streaming::KEY_YOUTUBE_MUSIC)
        Streaming::KEY_YOUTUBE_MUSIC
      else
        nil
      end
    end

    def detect_column_name_by_streaming_service_name(streaming_service)
      case streaming_service
      when Api::SPOTIFY
        Streaming::KEY_SPOTIFY
      when Api::APPLE_MUSIC
        Streaming::KEY_APPLE_MUSIC
      when Api::YOUTUBE_MUSIC
        Streaming::KEY_YOUTUBE_MUSIC
      else
        nil
      end
    end
  end
end
