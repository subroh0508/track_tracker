# frozen_string_literal: true

module Api
  class YoutubeClient
    include Api::Youtube::Channel
    include Api::Youtube::Playlist
    include Api::Youtube::PlaylistItem
    include Api::Youtube::Search

    def search_albums(query)
      youtube_music_ids = search_playlists(query).
        map { |summary| summary[:youtube_music_id] }

      fetch_playlists(youtube_music_ids)
=begin
        map { |playlist|
          item_count = playlist.delete(:item_count)

          playlist.merge(
            streaming_tracks: fetch_tracks(
              playlist[:youtube_music_id],
              item_count,
            )
          )
        }
=end
    end

    def search_artists(query)
      youtube_music_ids = search_channels(query).
        map { |summary| summary[:youtube_music_id] }

      fetch_channels(youtube_music_ids)
    end

    private

    def fetch_tracks(playlist_id, tracks_count)
      fetch_playlist_items(
        playlist_id,
        tracks_count,
      ).map { |item|
        video_owner_channel_id = item.delete(:video_owner_channel_id)

        item.merge(artists: fetch_channels(video_owner_channel_id))
      }
    end
  end
end
