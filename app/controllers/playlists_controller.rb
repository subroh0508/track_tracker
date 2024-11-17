class PlaylistsController < ApplicationController
  def search
    client = Api::Youtube::Search.new

    if params.key?(:query)
      @youtube_playlists = client.search(
        Api::Youtube::TYPE_PLAYLIST,
        params[:query],
      )
    else
      @youtube_playlists = []
    end
  end

  def show
    client = Api::Youtube::Playlist.new
    playlist = Playlist.find_by(id: params[:id])

    if playlist.present?
      @response = {
        title: playlist.title(locale: 'ja'),
        youtube_id: playlist.youtube_id,
      }
    elsif params.key?(:youtube_id)
      youtube_playlist = client.fetch(params[:youtube_id])

      @response = {
        title: youtube_playlist[:title],
        youtube_id: youtube_playlist[:id],
      }
    else
      @response = nil
    end
  end
end
