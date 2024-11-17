class PlaylistsController < ApplicationController
  def search
    if params.key?(:youtube_id)
      @playlists = search_playlists(params[:youtube_id])
    else
      @playlists = []
    end
  end

  def show
    playlist = Playlist.find(params[:id])

    @playlist = {
      title: playlist.title(locale: 'ja'),
      youtube_id: playlist.youtube_id,
    }
  end

  private

  def search_playlists(youtube_id)
    playlist_client = Api::Youtube::Playlist.new
    playlist_item_client = Api::Youtube::PlaylistItem.new

    playlist_client.fetch(youtube_id).
      map { |playlist|
        {
          title: playlist[:title],
          youtube_id: playlist[:id],
          tracks: playlist_item_client.fetch(
            playlist[:id],
            playlist[:item_count],
          ),
        }
      }
  end
end
