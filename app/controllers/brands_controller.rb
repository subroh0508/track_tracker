# frozen_string_literal: true

class BrandsController < ApplicationController
  def search
    @brand = brand
    @type = type
    @query = query

    if params.key?(:query)
      results = client.search_album(
        params[:query],
        "jp",
      ).reduce({}) { |acc, result|
        acc.merge(result[brand_key] => result)
      }
    else
      results = {}
    end

    records = Playlist.where(
      brand_key => results.keys,
    ).reduce({}) { |acc, record|
      acc.merge(record.public_send(brand_key.to_s) => record.id)
    }

    @albums = results.map { |key, value|
      if records.key?(key)
        value.merge(id: records[key])
      else
        value
      end
    }
  end

  def register
    case brand
    when Api::SPOTIFY
      @json = client.fetch_album(
        params[:brand_id],
        "jp",
      )
    when Api::YOUTUBE_MUSIC
      @json = nil
    when Api::APPLE_MUSIC
      @json = nil
    else
      throw ArgumentError.new("Unknown brand: #{brand}")
    end

    Playlists::SpotifyImportService.new(
      "ja",
      "album",
    ).execute!([@json])

    redirect_to "/brands/search/#{brand}/#{type}?query=#{query}"
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

  def brand_key
    case brand
    when Api::SPOTIFY
      Streaming::KEY_SPOTIFY
    when Api::YOUTUBE_MUSIC
      Streaming::KEY_YOUTUBE_MUSIC
    when Api::APPLE_MUSIC
      Streaming::KEY_APPLE_MUSIC
    else
      throw ArgumentError.new("Unknown brand: #{brand}")
    end
  end
end
