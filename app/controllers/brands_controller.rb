# frozen_string_literal: true

class BrandsController < ApplicationController
  def search
    client = Api::SpotifyClient.new

    if params.key?(:query)
      @albums = client.search_album(
        params[:query],
        "jp",
      )
    else
      @albums = []
    end
  end
end
