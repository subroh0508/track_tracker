# frozen_string_literal: true

module Api
  class YoutubeClient
    include Api::Youtube::Channel
    include Api::Youtube::Playlist
    include Api::Youtube::PlaylistItem
    include Api::Youtube::Search

    def fetch_playlist(id, locale)
      fetch_playlists(id, locale).map { |playlist|
        playlist.merge(
          tracks: fetch_tracks(
            playlist[:youtube_music_id],
            playlist[:total_tracks],
          ),
        )
      }[0]
    end

    def search_artists(query)
      youtube_music_ids = search_channels(query).
        map { |summary| summary[:youtube_music_id] }

      fetch_channels(youtube_music_ids)
    end

    private

    def fetch_tracks(playlist_id, tracks_count)
      items = fetch_playlist_items(
        playlist_id,
        tracks_count,
      )

      video_owner_channel_ids = items.map { |item|
        item[:video_owner_channel_id]
      }.uniq

      channels = fetch_channels(video_owner_channel_ids).reduce({}) { |acc, channel|
        acc.merge(channel[:youtube_music_id] => channel)
      }

      items.map { |item|
        item.merge(artists: [channels[item.delete(:video_owner_channel_id)]])
      }
    end
  end
end
