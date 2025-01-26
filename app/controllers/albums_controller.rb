# frozen_string_literal: true

class AlbumsController < ApplicationController
  def index
    @albums = Album.all.map { |album|
      album.to_json_hash("ja")
    }
  end

  def show
    @album = Album.find(params[:id]).
      to_json_hash("ja")
  end
end
