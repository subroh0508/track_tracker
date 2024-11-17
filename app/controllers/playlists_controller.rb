class PlaylistsController < ApplicationController
  def search
    client = Api::Youtube.new

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
  end
end
