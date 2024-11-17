class PlaylistsController < ApplicationController
  def search
    client = Api::Youtube::Playlist.new

    if params.key?(:youtube_id)
      @playlists = client.fetch(params[:youtube_id]).
        map { |playlist|
          {
            title: playlist[:title],
            youtube_id: playlist[:id],
          }
        }
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
end
