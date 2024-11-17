class TracksController < ApplicationController
  def search
    client = Api::Youtube::Search.new

    if params.key?(:query)
      @youtube_tracks = client.search(
        Api::Youtube::TYPE_VIDEO,
        params[:query],
      )
    else
      @youtube_tracks = []
    end
  end
end
