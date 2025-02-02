# frozen_string_literal: true

class AlbumsController < ApplicationController
  def index
    @albums = Album.all.map { |album|
      album.to_json_hash("ja")
    }
  end

  def show
    @album = get_album
  end

  def player
    @streaming_service = streaming_service
    @album = get_album
  end

  private

  def streaming_service
    params[:streaming_service] || Api::SPOTIFY
  end

  def get_album
    album = Album.find(params[:id])

    tracks = album.tracks.map { |track|
      track.to_json_hash("ja")
    }

    album.to_json_hash("ja").
      merge(tracks: tracks)
  end
end
