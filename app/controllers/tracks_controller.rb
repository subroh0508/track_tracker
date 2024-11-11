class TracksController < ApplicationController
  def search
    client = Api::Youtube.new

    if params.key?(:query)
      @youtube_tracks = client.search(params[:query])
    else
      @youtube_tracks = []
    end
  end
end
