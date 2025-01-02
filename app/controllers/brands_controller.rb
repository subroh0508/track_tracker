# frozen_string_literal: true

class BrandsController < ApplicationController
  def search
    @brand = brand
    @type = type
    @query = query

    if params.key?(:query)
      @albums = client.search_album(
        params[:query],
        "jp",
      )
    else
      @albums = []
    end
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

    puts @json

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
end
