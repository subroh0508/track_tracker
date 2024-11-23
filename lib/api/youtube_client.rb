# frozen_string_literal: true

module Api
  class YoutubeClient
    include Api::Youtube::Channel
    include Api::Youtube::Playlist
    include Api::Youtube::PlaylistItem
    include Api::Youtube::Search
  end
end
