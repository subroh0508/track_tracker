# frozen_string_literal: true

module Api
  class YoutubeClient
    include Api::Youtube::Channel
    include Api::Youtube::Playlist
    include Api::Youtube::PlaylistItem
    include Api::Youtube::Search

    def search_playlists(youtube_id)
      fetch_playlists(youtube_id).
        map { |playlist|
          {
            youtube_playlist_id: playlist[:id],
            title: playlist[:title],
            tracks: fetch_tracks(
              playlist[:id],
              playlist[:item_count],
            ),
          }
        }
    end

    private

    def fetch_tracks(id, tracks_count)
      fetch_playlist_items(
        id,
        tracks_count,
      ).map { |item|
        channel = fetch_channels(item[:video_owner_channel_id])[0]

        {
          youtube_video_id: item[:id],
          title: item[:title],
          position: item[:position],
          thumbnail_url: item[:thumbnail_url],
          artist: {
            youtube_channel_id: channel[:id],
            name: channel[:title],
          },
        }
      }
    end
  end
end
