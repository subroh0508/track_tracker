# frozen_string_literal: true

module StreamingTracks
  class SearchUnlinkedAlbumService
    include StreamingTracks::StreamingService

    def execute!(params)
      column_name = detect_streaming_service_id_column_name(params)
      return [] if column_name.blank?

      ::Album.where(column_name => nil).
        map { |album| album.to_json_hash("ja") }
    end
  end
end
