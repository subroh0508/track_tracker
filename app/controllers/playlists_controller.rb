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
    if params.key?(:youtube_id)
      client = Api::YoutubeClient.new

      @playlists = client.search_playlists(params[:youtube_id])
    else
      @playlists = []
    end
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

  private

  def search_playlists(youtube_id)
    client = Api::YoutubeClient.new

    client.fetch_playlists(youtube_id).
      map { |playlist|
        {
          title: playlist[:title],
          youtube_id: playlist[:id],
          tracks: client.fetch_playlist_items(
            playlist[:id],
            playlist[:item_count],
          ),
        }
      }
  end
end
