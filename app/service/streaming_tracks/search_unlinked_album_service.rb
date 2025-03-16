# frozen_string_literal: true

module StreamingTracks
  class SearchUnlinkedAlbumService
    include StreamingService::Common

    def execute!(params)
      column_name = detect_column_name_by_streaming_service_id(params)
      return [] if column_name.blank?

      ::Album.where(column_name => nil).
        map { |album| album.to_json_hash("ja") }
    end
  end
end
