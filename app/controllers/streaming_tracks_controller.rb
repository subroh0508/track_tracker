# frozen_string_literal: true

class StreamingTracksController < ApplicationController
  def index
    redirect_to "/streaming_tracks/register/#{Api::SPOTIFY}/#{Api::TYPE_ALBUM}/search"
  end

  def search
    @params_for_search = params_for_search
    @albums = StreamingTracks::SearchService.new("jp").
      execute!(
        brand,
        type,
        params_for_search,
      )

    @target_album = StreamingTracks::FindAlbumService.new("jp").
      execute!(params)

    @unlinked_albums = StreamingTracks::SearchUnlinkedAlbumService.new.
      execute!(params)
  end

  def register
    json = StreamingTracks::FindAlbumService.new("jp").
      execute!(params)

    StreamingTracks::ImportAlbumService.new("ja").
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
    redirect_to "/streaming_tracks/register/#{brand}/#{type}/search?query=#{params[:query]}&id=#{params[:id]}",
      allow_other_host: true
  end
end
