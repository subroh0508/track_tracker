# frozen_string_literal: true

module StreamingTracks
  class SearchUnlinkedAlbumService
    include StreamingTracks::Common

    def execute!(
      brand,
      target_id
    )
      return [] if target_id.blank?

      Playlist.with_thumbnails.
        with_artists.
        album.
        where(brand_key(brand) => nil).
        map { |playlist| playlist.to_json_hash("ja") }
    end
  end
end
