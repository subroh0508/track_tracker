# frozen_string_literal: true

class StreamingTracksController < ApplicationController
  def index
    redirect_to "/streaming_tracks/register/#{Api::SPOTIFY}/#{Api::TYPE_ALBUM}/search"
  end

  def search
    @brand = brand
    @type = type
    @query = query

    @albums = StreamingTracks::SearchService.new("jp").
      execute!(
        brand,
        type,
        query,
      )
  end

  def register
    case brand
    when Api::SPOTIFY
      @json = client.fetch_album(
        params[:brand_id],
        "jp",
      )
    when Api::APPLE_MUSIC
      @json = nil
    else
      throw ArgumentError.new("Unknown brand: #{brand}")
    end

    Playlists::SpotifyImportService.new(
      "ja",
      "album",
    ).execute!([@json])

    redirect_to "/streaming_tracks/register/#{brand}/#{type}/search?query=#{query}"
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

  def query
    params[:query] || ""
  end
end
