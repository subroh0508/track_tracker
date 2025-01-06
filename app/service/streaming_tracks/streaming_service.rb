# frozen_string_literal: true

module StreamingTracks
  module StreamingService
    def detect_streaming_service_id_column_name(params)
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
  end
end
