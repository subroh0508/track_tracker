# frozen_string_literal: true

module StreamingTracks
  class SearchService
    include StreamingTracks::Common

    def execute!(
      brand,
      type,
      params = { query: nil, id: nil }
    )
      results = search(brand, type, params)
      records = search_from_db(brand, results.keys)
      merge(results, records)
    end

    private

    def search(brand, type, params)
      case type
      when Api::TYPE_ALBUM
        results = search_albums(brand, params)
      when Api::TYPE_ARTIST
        results = search_artists(brand, params)
      when Api::TYPE_TRACK
        results = []
      else
        results = []
      end

      results.reduce({}) { |acc, result|
        acc.merge(result[brand_key(brand)] => result)
      }
    end

    def search_albums(brand, params)
      case brand
      when Api::SPOTIFY
        spotify_client.search_albums(params[:query], locale)
      when Api::APPLE_MUSIC
        []
        # apple_client.search_albums(params[:query])
      when Api::YOUTUBE_MUSIC
        youtube_client.fetch_playlists(params[:id], locale)
      else
        raise ArgumentError, "Unknown brand: #{brand}"
      end
    end

    def search_artists(brand, params)
      case brand
      when Api::SPOTIFY
        spotify_client.search_artists(params[:query], locale)
      when Api::APPLE_MUSIC
        []
        # apple_client.search_albums(params[:query])
      when Api::YOUTUBE_MUSIC
        []
      else
        raise ArgumentError, "Unknown brand: #{brand}"
      end
    end

    def search_from_db(brand, brand_ids)
      brand_key = brand_key(brand)

      ::Album.where(
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
      when Api::APPLE_MUSIC
        Streaming::KEY_APPLE_MUSIC
      when Api::YOUTUBE_MUSIC
        Streaming::KEY_YOUTUBE_MUSIC
      else
        throw ArgumentError.new("Unknown brand: #{brand}")
      end
    end
  end
end
