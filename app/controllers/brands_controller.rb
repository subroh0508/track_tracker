# frozen_string_literal: true

class BrandsController < ApplicationController
  def search
    @brand = brand
    @type = type
    @query = query

    client = Api::SpotifyClient.new

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
    puts params

    redirect_to "/brands/search/#{brand}/#{type}?query=#{query}"
  end

  private

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
