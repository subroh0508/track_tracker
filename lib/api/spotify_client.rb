# frozen_string_literal: true

module Api
  class SpotifyClient
    include Api::Spotify::Album
    include Api::Spotify::Artist
    include Api::Spotify::Search
  end
end
