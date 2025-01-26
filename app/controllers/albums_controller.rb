# frozen_string_literal: true

class AlbumsController < ApplicationController
  def index
    @albums = Album.all.map { |album|
      album.to_json_hash("ja")
    }
  end

  def show
    album = Album.find(params[:id])

    tracks = album.tracks.map { |track|
      track.to_json_hash("ja")
    }

    @album = album.to_json_hash("ja").
      merge(tracks: tracks)
  end
end
