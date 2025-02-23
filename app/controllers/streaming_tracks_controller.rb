# frozen_string_literal: true

class StreamingTracksController < ApplicationController
  def index
    redirect_to url_for(
      controller: :streaming_tracks,
      action: :search,
      brand: Api::SPOTIFY,
      type: Api::TYPE_ALBUM,
    )
  end

  def search
    @params_for_search = params_for_search
    @albums = StreamingTracks::SearchService.new(I18n.locale).
      execute!(
        brand,
        type,
        params_for_search,
      )

    @target_album = StreamingTracks::FindAlbumService.new(I18n.locale).
      execute!(params)

    @unlinked_albums = StreamingTracks::SearchUnlinkedAlbumService.new.
      execute!(params)
  end

  def register
    json = StreamingTracks::FindAlbumService.new(I18n.locale).
      execute!(params)

    StreamingTracks::ImportAlbumService.new(I18n.locale).
      execute!([json])

    redirect_to_search
  end

  def link
    StreamingTracks::LinkAlbumService.new.
      execute!(
        params[:target_id],
        params[:album],
      )

    redirect_to_search
  end

  private

  def client
    @client ||= Api::SpotifyClient.new
  end

  def brand
    params[:brand] || Api::SPOTIFY
  end

  def type
    params[:type] || Api::TYPE_ALBUM
  end

  def params_for_search
    {
      brand: brand,
      type: type,
      query: params[:query].presence,
      id: params[:id].presence,
    }.compact
  end

  def redirect_to_search
    redirect_to url_for(
      controller: :streaming_tracks,
      action: :search,
      brand: brand,
      type: type,
      params: {
        id: params[:id],
        query: params[:query],
      },
    ), allow_other_host: true
  end
end
