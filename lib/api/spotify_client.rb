# frozen_string_literal: true

module Api
  class SpotifyClient
    include Api::Spotify::Album
    include Api::Spotify::Search

    def search_albums(
      query,
      locale,
      options: {
        artist_id: nil,
      }
    )
      if options[:artist_id].blank?
        search_albums(query, locale)
      else
        fetch_albums_from_artist(options[:artist_id], locale)
      end
    end
  end
end
