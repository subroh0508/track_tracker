# frozen_string_literal: true

class AlbumsController < ApplicationController
  def search
    client = Api::SpotifyClient.new

    @json = client.search_album(
      "Today Is A Beautiful Day",
      "jp",
    )
  end
end
