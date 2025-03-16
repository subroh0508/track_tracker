# frozen_string_literal: true

module StreamingService
  module Cache
    attr_reader :track_cache, :artist_cache

    def reset_cache(column_name, albums_params)
      track_params_array = albums_params.map { |album_params|
        album_params[:tracks]
      }.flatten

      artist_params_array = albums_params.map { |album_params|
        album_params[:artists]
      }.flatten + track_params_array.map { |track_params|
        track_params[:artists]
      }.flatten

      @track_cache = Streaming::Tracks::Cache.new(
        column_name,
        track_params_array.map { |track_params|
          track_params[column_name]
        },
      )

      @artist_cache = Streaming::Artists::Cache.new(
        column_name,
        artist_params_array.map { |artist_params|
          artist_params[column_name]
        },
      )
    end
  end
end
