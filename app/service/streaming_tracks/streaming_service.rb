# frozen_string_literal: true

module StreamingTracks
  module StreamingService
    def detect_streaming_service_id_column_name(params)
      [
        Streaming::KEY_SPOTIFY,
        Streaming::KEY_APPLE_MUSIC,
        Streaming::KEY_YOUTUBE_MUSIC,
      ].each do |column_name|
        return column_name if params.key?(column_name)
      end
    end
  end
end
