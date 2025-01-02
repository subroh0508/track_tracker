# frozen_string_literal: true

module Brands
  class SearchService
    def initialize(locale)
      @locale = locale
      @spotify_client = Api::SpotifyClient.new
      @youtube_client = Api::YoutubeClient.new
    end

    def execute!(brand, type, query)
      results = search(brand, type, query)
      records = search_from_db(brand, results.keys)
      merge(results, records)
    end

    private

    attr_reader :locale, :spotify_client, :youtube_client

    def search(brand, type, query)
      case type
      when Api::TYPE_ALBUM
        results = search_albums(brand, query)
      when Api::TYPE_ARTIST
        results = []
      when Api::TYPE_TRACK
        results = []
      else
        results = []
      end

      results.reduce({}) { |acc, result|
        acc.merge(result[brand_key(brand)] => result)
      }
    end

    def search_albums(brand, query)
      case brand
      when Api::SPOTIFY
        spotify_client.search_albums(query, locale)
      when Api::YOUTUBE_MUSIC
        youtube_client.search_albums(query)
      when Api::APPLE_MUSIC
        []
        # apple_client.search_albums(query)
      else
        raise ArgumentError, "Unknown brand: #{brand}"
      end
    end

    def search_from_db(brand, brand_ids)
      brand_key = brand_key(brand)

      Playlist.where(
        brand_key => brand_ids,
        ).reduce({}) { |acc, record|
        acc.merge(record.public_send(brand_key.to_s) => record.id)
      }
    end

    def merge(results, records)
      results.map { |key, value|
        if records.key?(key)
          value.merge(id: records[key])
        else
          value
        end
      }
    end

    def brand_key(brand)
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
end
