# frozen_string_literal: true

class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all.map { |playlist|
      {
        id: playlist.id,
        youtube_playlist_id: playlist.youtube_playlist_id,
        title: playlist.localized_title("ja"),
        tracks: playlist.tracks.map { |track|
          {
            id: track.id,
            youtube_video_id: track.youtube_video_id,
            title: track.localized_title("ja"),
            artist: {
              id: track.artist.id,
              youtube_channel_id: track.artist.youtube_channel_id,
              name: track.artist.localized_name("ja"),
            },
          }
        },
      }
    }
  end

  def search
    @playlists = []
  end

  def spotify
    client = Api::SpotifyClient.new

    @json = client.fetch_album(
      "48KseHW22uKEJjgTKZCtk7",
      "jp",
    )
  end

  def create
    Playlists::YoutubeImportService.new(
      "ja",
      "album",
    ).execute!(params[:playlists])

    redirect_to action: "index", status: :ok
  end

  def show
    playlist = Playlist.preload(playlist_tracks: :track).find(params[:id])

    @playlist = {
      title: playlist.localized_title("ja"),
      brand: params[:brand],
      tracks: playlist.playlist_tracks.
        map { |playlist_track|
          {
            position: playlist_track.position + 1,
            title: playlist_track.track.localized_title("ja"),
            thumbnail_url: nil,
            artist: playlist_track.track.artist.localized_name("ja"),
          }
        },
    }
  end
end
