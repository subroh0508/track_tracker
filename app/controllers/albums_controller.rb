# frozen_string_literal: true

class AlbumsController < ApplicationController
  def index
    @albums = Album.all.map { |album|
      album.to_json_hash!(
        I18n.locale,
        I18n.default_locale,
      )
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

    tracks = album.tracks.
      with_translations.
      map { |track|
        track.to_json_hash!(
          I18n.locale,
          I18n.default_locale,
        )
      }

    album.to_json_hash!(
        I18n.locale,
        I18n.default_locale,
      ).
      merge(tracks: tracks)
  end
end
